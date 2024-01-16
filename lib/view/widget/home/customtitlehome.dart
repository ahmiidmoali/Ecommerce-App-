import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class CustomTitleHome extends StatelessWidget {
  final String text;
  const CustomTitleHome({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor),
      ),
    );
  }
}
