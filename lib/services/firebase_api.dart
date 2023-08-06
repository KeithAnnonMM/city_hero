import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseAPi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    await _firebaseMessaging.getToken().then((value) {
      print('FCMToken: $value');
    });

    FirebaseMessaging.onBackgroundMessage(handleMessage);
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      print('Title:${message?.notification!.title}');
      print('Body:${message?.notification!.body}');
    });
  }

  Future<void> handleMessage(RemoteMessage message) async {
    print('Title:${message.notification!.title}');
    print('Body:${message.notification!.body}');
  }
}
