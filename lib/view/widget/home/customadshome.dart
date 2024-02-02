import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/appcolor.dart';
import '../../../controller/homepageanimate_controller.dart';
import '../../../linkapi.dart';

class CustomAds1 extends GetView<HomePageAnimateController> {
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
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imageads}/$imagename",
                width: Get.width,
                fit: BoxFit.fill,
              )),
          Positioned(
              bottom: 5,
              left: 5,
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
              ))
        ],
      ),
    );
  }
}
