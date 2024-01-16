import 'package:flutter/material.dart';

import 'appcolor.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.black),
      displaySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          height: 2,
          color: AppColor.grey)),
  primarySwatch: Colors.blue,
);
ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.black),
      displaySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          height: 1.5,
          color: AppColor.grey)),
  primarySwatch: Colors.blue,
);
