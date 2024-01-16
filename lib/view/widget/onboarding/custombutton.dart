import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/onboarding_controller.dart';

import '../../../core/constant/appcolor.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        controller.next();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        width: 280,
        height: 40,
        child: Text(
          "9-1".tr, // "Continue"
          style: TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
