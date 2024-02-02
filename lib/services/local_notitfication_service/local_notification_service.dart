import 'package:api_mock/core/models/notification.dart';
import 'package:api_mock/services/notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final class LocalNotificationService implements NotificationService {
  NotificationDetails get _notificationDetails => const NotificationDetails(
        android: AndroidNotificationDetails(
          'channelId',
          'channelName',
          importance: Importance.max,
        ),
      );

  final _notificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  initializeNitification({Function? onCallback}) async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    _notificationsPlugin.initialize(
      const InitializationSettings(
        android: android,
      ),
      onDidReceiveNotificationResponse: (_) =>
          onCallback != null ? onCallback() : null,
    );
  }

  @override
  Future<void> showNotification(TimeoutNotification notification) =>
      _notificationsPlugin.show(
        notification.id,
        notification.title,
        notification.body,
        _notificationDetails,
      );
}
