import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const CustomButtonCoupon(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 0),
        alignment: Alignment.center,

        height: 37,
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "PlayfairDisplay",
              fontWeight: FontWeight.w300,
              fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
