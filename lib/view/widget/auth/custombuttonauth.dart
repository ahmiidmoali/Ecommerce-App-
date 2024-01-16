import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const CustomButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(30)),
        width: 400,
        height: 40,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
