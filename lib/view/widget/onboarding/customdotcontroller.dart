import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/onboarding_controller.dart';

import '../../../core/constant/appcolor.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
                margin: const EdgeInsets.only(right: 5),
                width: controller.currentpage == index ? 12 : 6,
                height: 6,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(5)),
                duration: const Duration(microseconds: 900))),
      ),
    );
  }
}
