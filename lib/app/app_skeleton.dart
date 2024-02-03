// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_mock/core/life_cycle/interaction_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:api_mock/app/app_cubit.dart';
import 'package:api_mock/core/theme/app_colors.dart';
import 'package:api_mock/features/creating_page/creating_page.dart';
import 'package:api_mock/features/home_page/home_page.dart';
import 'package:api_mock/features/home_page/parts/home_nav_bar.dart';
import 'package:api_mock/features/home_page/parts/home_scaffold.dart';
import 'package:api_mock/features/settings_page/settings_page.dart';
import 'package:api_mock/services/notification_service.dart';

class AppSkeleton extends StatefulWidget {
  const AppSkeleton(
    this.notificationService, {
    Key? key,
  }) : super(key: key);

  final NotificationService notificationService;

  @override
  State<AppSkeleton> createState() => _AppSkeletonState();
}

class _AppSkeletonState extends State<AppSkeleton> {
  @override
  Widget build(BuildContext context) {
    return InteractiveTimer(
      notificationService: widget.notificationService,
      child: HomeScaffold(
        bottomNavigationBar: HomeNavBar(
          currentIndex: context.watch<AppCubit>().state.index,
          onTap: (index) => context.read<AppCubit>().navigatePage(index),
        ),
        child: _returnProperPage(),
      ),
    );
  }

  Widget _returnProperPage() {
    final cubit = context.read<AppCubit>();
    switch (cubit.state.index) {
      case 0:
        return const HomePage();
      case 1:
        return CreatingPage(cubit.state.postItem);
      default:
        return const SettingsPage();
    }
  }
}

class CustomErrorSnackbar {
  static void showErrorSnackbar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error, color: AppColors.primaryLight),
            const SizedBox(width: 8),
            Text(
              errorMessage,
              style: const TextStyle(color: AppColors.primaryLight),
            ),
          ],
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
