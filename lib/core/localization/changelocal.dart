import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/apptheme.dart';
import 'package:project33/core/functions/fcmconfig.dart';
import 'package:project33/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;
  changelang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmConfig();
    String? sharePrefLang = myServices.sharedPreferences.getString("lang");
    if (sharePrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharePrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
