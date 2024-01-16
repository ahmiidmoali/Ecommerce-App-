import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class CustomCartTopCard extends StatelessWidget {
  final String body;
  const CustomCartTopCard({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(.7),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        body,
        style: const TextStyle(
          color: AppColor.white,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
