import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Notification() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print("user granted permissino: ${settings.authorizationStatus}");
  }
}
