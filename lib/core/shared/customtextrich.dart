import 'package:flutter/material.dart';

import '../constant/appcolor.dart';

class CustomTextRichPrice extends StatelessWidget {
  final String why;
  final String after;
  final String before;
  const CustomTextRichPrice(
      {super.key,
      required this.why,
      required this.after,
      required this.before});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: why,
        children: <TextSpan>[
          new TextSpan(
            text: before,
            style: new TextStyle(
                fontSize: 25,
                fontFamily: "sans",
                height: 1,
                color: Colors.red,
                decorationColor: Colors.black,
                decoration: TextDecoration.lineThrough,
                decorationThickness: 3),
          ),
          new TextSpan(
            text: after,
            style: new TextStyle(
                fontFamily: "sans",
                fontSize: 25,
                color: Colors.green,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CustomTextPrice extends StatelessWidget {
  final String price;
  const CustomTextPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      style: const TextStyle(
          fontFamily: "sans",
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryColor),
    );
  }
}
