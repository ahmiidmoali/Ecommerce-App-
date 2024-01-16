import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class customButtonCheckout extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const customButtonCheckout(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 35,
        decoration: BoxDecoration(color: AppColor.primaryColor),
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
