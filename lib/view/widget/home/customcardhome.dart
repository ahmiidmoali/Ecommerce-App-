import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homepage_controller.dart';
import '../../../core/constant/appcolor.dart';

class CustomCardHome extends GetView<HomePageControllerImp> {
  final String title;
  final String body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 80,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10)),
          ),
          Positioned(
              right: controller.lang == "en" ? -15 : null,
              left: controller.lang == "ar" ? -15 : null,
              top: -20,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75),
                    color: AppColor.grey1),
              )),
          Positioned(
            child: Container(
              alignment: Alignment.center,
              height: 80,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                subtitle: Text(
                  body,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
