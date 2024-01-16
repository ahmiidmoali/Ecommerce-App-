import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/itemsdetails_controller.dart';

import '../../../core/constant/appcolor.dart';
import '../../../linkapi.dart';

class CustomImageItemsDetails extends GetView<ItemsDetailsControllerImp> {
  const CustomImageItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          color: AppColor.primaryColor,
        ),
        Positioned(
            left: Get.width / 10,
            right: Get.width / 10,
            top: 40,
            child: Hero(
              tag: controller.itemsmodel.itemsId!,
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.imageitems}/${controller.itemsmodel.itemsImage}",
                height: 280,
              ),
            ))
      ],
    );
  }
}
