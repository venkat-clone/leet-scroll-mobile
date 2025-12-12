import 'package:injectable/injectable.dart';
import '../services/notification_service.dart';

@module
abstract class NotificationModule {
  @lazySingleton
  NotificationService get notificationService => NotificationService();
}
