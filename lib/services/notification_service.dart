import 'package:api_mock/core/models/notification.dart';

abstract interface class NotificationService {
  void initializeNitification({Function? onCallback});
  void showNotification(TimeoutNotification notification);
}
