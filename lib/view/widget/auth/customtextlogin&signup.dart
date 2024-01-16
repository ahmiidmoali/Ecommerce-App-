import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class customTextLogin_SignUp extends StatelessWidget {
  final Function()? onTap;
  final String Text1;
  final String Text2;
  const customTextLogin_SignUp(
      {super.key,
      required this.onTap,
      required this.Text1,
      required this.Text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Text1,
          style: TextStyle(color: AppColor.grey, fontSize: 15),
        ),
        InkWell(
          onTap: onTap,
          child: Text(Text2,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor)),
        )
      ],
    );
  }
}
