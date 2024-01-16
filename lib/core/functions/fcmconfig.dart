import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:project33/controller/notifications_controller.dart';

import '../../controller/orders/pending_controller.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((event) {
    // print("==============notification=============");
    // print(event.notification!.title);
    // print(event.notification!.body);
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(event.notification!.title!, event.notification!.body!);
    NotificationsController controllerN = Get.put(NotificationsController());
    controllerN.onInit();
    if (Get.currentRoute == event.data["pagename"]) {
      print("=============refresh==============");
      PendingController controller = Get.find();
      controller.onInit();
    }
  });
}
