import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/onboarding_controller.dart';
import 'package:project33/core/services/services.dart';

import '../../../core/constant/appcolor.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  CustomSliderOnBoarding({super.key});

  MyServices servicesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Column(children: [
          const SizedBox(
            height: 1,
          ),
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            onBoardingList[index].image!,
            height: Get.width / 1.3,
            fit: BoxFit.fill,
          ),
          Text(onBoardingList[index].title!,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black)),
          const SizedBox(
            height: 10,
          ),
          Text(
            onBoardingList[index].body!,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height:
                    servicesController.sharedPreferences.getString("lang") ==
                            "ar"
                        ? 1.5
                        : 2,
                color: AppColor.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
        ]);
      },
    );
  }
}
