import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class CustomTextCheckout extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final bool isactive;

  const CustomTextCheckout(
      {super.key, required this.text, required this.isactive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color:
                isactive == true ? AppColor.other2Color : AppColor.other3Color,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: isactive ? AppColor.white : AppColor.other2Color,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
