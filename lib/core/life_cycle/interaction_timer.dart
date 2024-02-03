import 'dart:async';

import 'package:api_mock/app/app_cubit.dart';
import 'package:api_mock/core/l10n/generated/l10n.dart';
import 'package:api_mock/core/models/notification.dart';
import 'package:api_mock/features/home_page/cubit/home_cubit.dart';
import 'package:api_mock/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InteractiveTimer extends StatefulWidget {
  const InteractiveTimer({
    super.key,
    required this.child,
    this.maxInactivityTime = const Duration(seconds: 20),
    required this.notificationService,
  });

  final Widget child;
  final Duration maxInactivityTime;
  final NotificationService notificationService;

  @override
  State<InteractiveTimer> createState() => _InteractiveTimerState();
}

class _InteractiveTimerState extends State<InteractiveTimer>
    with WidgetsBindingObserver {
  Timer? _inactivityUserTimer;
  DateTime? _pauseTime;
  bool _isNotificationCallback = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    widget.notificationService.initializeNitification(onCallback: _onCallback);
    super.initState();
  }

  void _onCallback() async {
    _isNotificationCallback = true;
    _reopenApp();
  }

  void _reopenApp() => context.read<AppCubit>().navigatePage(0);

  @override
  void didUpdateWidget(InteractiveTimer oldWidget) {
    _initTimer();
    super.didUpdateWidget(oldWidget);
  }

  void _initTimer() {
    _inactivityUserTimer?.cancel();
    _inactivityUserTimer = Timer(
      widget.maxInactivityTime,
      _callPushNotification,
    );
  }

  void _callPushNotification() {
    _inactivityUserTimer?.cancel();
    widget.notificationService.showNotification(
      TimeoutNotification(
        title: AppLocalizations.current.timesUp,
        body: AppLocalizations.current.away,
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _inactivityUserTimer?.cancel();
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        _inactivityUserTimer?.cancel();
        _pauseTime ??= DateTime.now().toUtc();
        return;
      case AppLifecycleState.resumed:
        try {
          _onAppResumed();
        } catch (error) {
          throw Exception(
              AppLocalizations.current.resumeAppError(error.toString()));
        } finally {
          _pauseTime = null;
        }
    }
  }

  Future<void> _onAppResumed() async {
    await _handleNotificationCallback();
    _initTimer();
    _isNotificationCallback = false;
    if (_onInactiveTimeExceeded()) {
      _callPushNotification();
    }
  }

  bool _onInactiveTimeExceeded() {
    final resumedTime = DateTime.now().toUtc();
    final pausedTime = _pauseTime ?? resumedTime;
    final deltaTimeInMilliseconds =
        resumedTime.difference(pausedTime).inMilliseconds;
    return deltaTimeInMilliseconds >= widget.maxInactivityTime.inMilliseconds;
  }

  Future<void> _handleNotificationCallback() async {
    if (!_isNotificationCallback) {
      final cubit = context.read<HomeCubit>();

      if (cubit.state is HomeLoadingState) {
        await Future.delayed(const Duration(seconds: 1));
        _handleNotificationCallback();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          _initTimer();
        }
      },
      child: Listener(
        onPointerDown: (_) => _initTimer(),
        onPointerSignal: (_) => _initTimer(),
        child: widget.child,
      ),
    );
  }
}
