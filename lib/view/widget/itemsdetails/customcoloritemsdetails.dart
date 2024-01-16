import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/itemsdetails_controller.dart';

import '../../../core/constant/appcolor.dart';

class CustomColorItemsDetails extends GetView<ItemsDetailsControllerImp> {
  const CustomColorItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
            controller.color.length,
            (index) => Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 10, left: 10),
                  height: 70,
                  width: 100,
                  decoration: BoxDecoration(
                      color: controller.color[index]["active"] == 0
                          ? AppColor.white
                          : AppColor.Blueblack,
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    controller.color[index]["name"],
                    style: TextStyle(
                        color: controller.color[index]["active"] == 0
                            ? AppColor.Blueblack
                            : AppColor.white,
                        height: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ))
      ],
    );
  }
}
