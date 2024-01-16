import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:project33/data/model/addressmodel.dart';

import '../../../core/constant/appcolor.dart';

class CustomCardCheckout extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onTap;
  final bool isactive;

  const CustomCardCheckout(
      {super.key,
      required this.isactive,
      this.onTap,
      required this.addressModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(vertical: 5),
        color: isactive ? AppColor.other2Color : AppColor.white,
        child: ListTile(
          title: Text(
            "${addressModel.addressName}",
            style: TextStyle(
                fontSize: 20,
                color: isactive ? AppColor.white : null,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "  ${addressModel.addressCity} /${addressModel.addressStreet}",
            style: TextStyle(
                fontSize: 15,
                color: isactive ? AppColor.white : null,
                fontWeight: FontWeight.bold),
          ),
          trailing: Text(
            "${addressModel.addressPhone}",
            style: TextStyle(
                fontSize: 20,
                color: isactive ? AppColor.white : null,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
