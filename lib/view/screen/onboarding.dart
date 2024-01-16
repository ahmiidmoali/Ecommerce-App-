import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/onboarding_controller.dart';
import 'package:project33/core/constant/appcolor.dart';

import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customdotcontroller.dart';
import '../widget/onboarding/customslider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: SafeArea(child: CustomSliderOnBoarding()),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const CustomDotControllerOnBoarding(),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back)),
                    const CustomButtonOnBoarding()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
