import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _messagesStreamController = StreamController<String>.broadcast();

  Stream<String> get messages => _messagesStreamController.stream;

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) {
      print("=================> FCM TOKEN ==========> $token");
    });

    _firebaseMessaging.configure(onMessage: (info) {
      print("========== On Message ===============");
      print("$info");

      String data = 'no-data';
      if (Platform.isAndroid) {
        data = info['data']['comida'] ?? 'no-data';
      }

      _messagesStreamController.sink.add(data);
    }, onLaunch: (info) {
      print("========== On Launch ===============");
      print("$info");
    }, onResume: (info) {
      print("========== On Resume ===============");
      print("$info");

      final noti = info['data']['comida'];
      _messagesStreamController.sink.add(noti);
    });
  }

  dispose() {
    _messagesStreamController?.close();
  }
}
