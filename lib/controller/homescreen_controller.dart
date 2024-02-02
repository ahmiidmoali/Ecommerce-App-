import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/core/functions/translatedatabase.dart';
import 'package:project33/view/screen/homepage.dart';
import 'package:project33/view/screen/notifications_page.dart';
import 'package:project33/view/screen/offers.dart';
import 'package:project33/view/screen/profile.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int current = 0;
  @override
  changePage(i) {
    current = i;
    update();
  }

  List<Widget> mypages = [
    const homePage(),
    const notificationsPage(),
    const profilePage(),
    const offersPage()
  ];
  List<String> appbarname = [
    "h3".tr,
    "h4".tr,
    "h5".tr,
    "h6".tr
  ]; //"home", "notifica", "Settings", "offers"
  List iconsList = [
    Icons.home_outlined,
    Icons.notifications_active_outlined,
    Icons.settings_outlined,
    Icons.local_offer_outlined
  ];
  exetfromapp() {
    Get.defaultDialog(
      title: "Do you want to",
      titlePadding: EdgeInsets.only(top: 5, bottom: 0),
      contentPadding: EdgeInsets.only(top: 4, bottom: 5),
      middleText: "Exit from the App",
      buttonColor: AppColor.primaryColor,
      middleTextStyle: TextStyle(fontSize: 25),
      confirmTextColor: AppColor.white,
      cancelTextColor: AppColor.primaryColor,
      onConfirm: () {
        exit(0);
      },
      onCancel: () {},
    );
    return Future.value(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
