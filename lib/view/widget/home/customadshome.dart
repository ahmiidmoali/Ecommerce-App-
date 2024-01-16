import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/homepage_controller.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/core/constant/imageasset.dart';

class CustomAds1 extends GetView<HomePageControllerImp> {
  final String imagename;
  const CustomAds1({super.key, required this.imagename});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 150,
      child: Stack(
        children: [
          Container(
            color: Colors.amber,
            child: Image.asset(
              imagename,
              width: Get.width,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              top: 100,
              left: 20,
              child: MaterialButton(
                onPressed: () {},
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  padding: const EdgeInsets.all(1),
                  height: 25,
                  width: 80,
                  child: const Text(
                    "SHOP NOW",
                    style: TextStyle(
                        height: 1.5,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class CustomAds2 extends StatelessWidget {
  const CustomAds2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 150,
      child: Stack(
        children: [
          Container(
            color: Colors.amber,
            child: Image.asset(
              AppImageAsset.lenovoads,
              width: Get.width,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              top: 100,
              left: 20,
              child: MaterialButton(
                onPressed: () {},
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  padding: const EdgeInsets.all(1),
                  height: 25,
                  width: 80,
                  child: const Text(
                    "SHOP NOW",
                    style: TextStyle(
                        height: 1.5,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
