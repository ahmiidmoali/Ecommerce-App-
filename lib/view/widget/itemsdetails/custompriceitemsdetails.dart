import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/itemsdetails_controller.dart';

import '../../../core/constant/appcolor.dart';

class CustomPriceItemsDetails extends StatelessWidget {
  final Widget countwidget;
  final Widget price;
  final void Function()? addBottun;
  final void Function()? removeBottun;
  const CustomPriceItemsDetails(
      {super.key,
      required this.price,
      required this.addBottun,
      required this.removeBottun,
      required this.countwidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(onPressed: addBottun, icon: Icon(Icons.add)),
            Container(
                alignment: Alignment.center,
                height: 35,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                ),
                child: countwidget),
            IconButton(onPressed: removeBottun, icon: Icon(Icons.remove))
          ],
        ),
        price
      ],
    );
  }
}
