import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/homepage_controller.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/data/model/itemsmodel.dart';
import 'package:project33/data/model/topsellingmodel.dart';

import 'package:project33/view/widget/home/listitemshome.dart';

import '../../../controller/favourite_controller.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../linkapi.dart';

class LabtopItemsHome extends GetView<HomePageControllerImp> {
  const LabtopItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteController favcontroller = Get.find();
    return Container(
      height: 255,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(controller.topselling.length, (index) {
                favcontroller
                        .favouriteMap[controller.items[index]["items_id"]] =
                    controller.items[index]["favourites"];
                return controller.topselling[index].categoriesId == 1
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListItems(
                          itemsmodel: controller.topselling2[index],
                          topSellingModel: controller.topselling[index],
                        ),
                      )
                    : SizedBox(
                        width: 0,
                      );
              })
            ],
          )
        ],
      ),
    );
  }
}

class AllListItems extends GetView<HomePageControllerImp> {
  final TopSellingModel topSellingModel;
  final Itemsmodel itemsmodel;
  const AllListItems(
      {super.key, required this.topSellingModel, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: (Get.width / 2) * .9,
      height: (Get.width / 2) * 1.5,
      child: InkWell(
        onTap: () {
          controller.goToItemsDetails(itemsmodel);
        },
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: (Get.width / 2) * 1.2,
              width: (Get.width / 2) * .9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(.1)),
            ),
            Positioned(
              top: 55,
              child: Image.network(
                "${AppLink.imageitems}/${topSellingModel.itemsImage}",
                alignment: Alignment.center,
                height: 100,
                width: 150,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 15,
              left: 20,
              child: Container(
                width: (Get.width / 2) * .8,
                child: Text(
                  "${translateDataBase(topSellingModel.itemsName, topSellingModel.itemsNameAr)}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 3,
              child: Container(
                width: (Get.width / 2) * .7,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "EGP",
                          style: const TextStyle(
                            height: 1,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          " ${(topSellingModel.itemsPrice! - topSellingModel.itemsPrice! * topSellingModel.itemsDiscount! / 100)}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "sans",
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (topSellingModel.itemsDiscount != 0)
              Positioned(
                bottom: 11,
                left: 20,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "${topSellingModel.itemsPrice}",
                      style: const TextStyle(
                        decorationColor: Colors.black,
                        decoration: TextDecoration.lineThrough,
                        fontFamily: "sans",
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "   ${topSellingModel.itemsDiscount}%",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            Positioned(
                bottom: 15,
                right: 1,
                child: GetBuilder<FavouriteController>(
                  builder: (controller) => IconButton(
                    onPressed: () {
                      print("${controller.favouriteMap}");
                      if (controller.favouriteMap[topSellingModel.itemsId] ==
                          1) {
                        controller.setFavourite(topSellingModel.itemsId, 0);
                        controller.removeFavourite(
                            topSellingModel.itemsId.toString());
                      } else {
                        controller.setFavourite(topSellingModel.itemsId, 1);
                        controller
                            .addFavourite(topSellingModel.itemsId.toString());
                      }
                    },
                    icon: controller.favouriteMap[topSellingModel.itemsId] == 1
                        ? const Icon(
                            Icons.favorite,
                            color: AppColor.primaryColor,
                          )
                        : const Icon(
                            Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
