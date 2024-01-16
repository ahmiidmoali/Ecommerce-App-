import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';
import '../../../core/constant/imageasset.dart';
import 'package:get/get.dart';

class CustomImageCheckout extends StatelessWidget {
  final String imagename;
  final String imagetext;
  final void Function()? onTap;
  final bool isactive;

  const CustomImageCheckout(
      {super.key,
      required this.imagename,
      required this.isactive,
      this.onTap,
      required this.imagetext});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width / 2 - 30,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(),
            color: isactive == true ? AppColor.other2Color : null),
        child: Column(
          children: [
            Image.asset(
              imagename,
              height: 120,
              width: 120,
              fit: BoxFit.fill,
              color: isactive == true ? AppColor.white : null,
            ),
            Text(
              imagetext,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:
                      isactive == true ? AppColor.white : AppColor.other2Color),
            )
          ],
        ),
      ),
    );
  }
}
