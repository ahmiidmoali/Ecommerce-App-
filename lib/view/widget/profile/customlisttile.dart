import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class CustomProfileListTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? onpress;

  const CustomProfileListTile(
      {super.key,
      required this.title,
      required this.onpress,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.white,
      ),
      child: ListTile(
          leading: Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
          trailing: IconButton(onPressed: onpress, icon: Icon(icon))),
    );
  }
}
