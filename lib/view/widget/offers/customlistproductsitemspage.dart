import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/favourite_controller.dart';
import 'package:project33/controller/itemspage_controller.dart';
import 'package:project33/core/constant/imageasset.dart';
import 'package:project33/data/model/itemsmodel.dart';

import '../../../controller/offers_controller.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../linkapi.dart';

class CustomListOffersItemsPage extends GetView<OffersPageControllerImp> {
  final Itemsmodel itemsmodel;
  const CustomListOffersItemsPage({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    ArabicNumbers arabicNumber = ArabicNumbers();
    // FavouriteController favcontroller = Get.put(FavouriteController());
    return InkWell(
      onTap: () {
        controller.goToItemsDetails(itemsmodel);
      },
      child: Stack(
        children: [
          Card(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Hero(
                    tag: itemsmodel.itemsId!,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageitems}/${itemsmodel.itemsImage!}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    "${translateDataBase(itemsmodel.itemsName, itemsmodel.itemsNameAr)}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  // Row(
                  //   children: [
                  //     const Text("Rating 4.0"),
                  //     const SizedBox(
                  //       width: 5,
                  //     ),
                  //     ...List.generate(
                  //         5,
                  //         (index) => const Icon(
                  //               Icons.star,
                  //               size: 18,
                  //             ))
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        translateDataBase(
                            "EGP ${itemsmodel.itemsafterdiscount!.toInt()}",
                            arabicNumber.convert(
                                "${itemsmodel.itemsafterdiscount!.toInt()} جنية ")),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColor.primaryColor,
                            fontFamily: "sans"),
                      ),
                      GetBuilder<FavouriteController>(
                        builder: (controller) => IconButton(
                          onPressed: () {
                            print("${controller.favouriteMap}");
                            if (controller.favouriteMap[itemsmodel.itemsId] ==
                                1) {
                              controller.setFavourite(itemsmodel.itemsId, 0);
                              controller.removeFavourite(
                                  itemsmodel.itemsId.toString());
                            } else {
                              controller.setFavourite(itemsmodel.itemsId, 1);
                              controller
                                  .addFavourite(itemsmodel.itemsId.toString());
                            }
                          },
                          icon: controller.favouriteMap[itemsmodel.itemsId] == 1
                              ? const Icon(
                                  Icons.favorite,
                                  color: AppColor.primaryColor,
                                )
                              : const Icon(
                                  Icons.favorite_border_outlined,
                                  color: AppColor.primaryColor,
                                ),
                        ),
                      )
                    ],
                  )
                ]),
          ),
          if (itemsmodel.itemsDiscount != 0)
            Positioned(
                top: -3,
                left: 0,
                child: Image.asset(
                  AppImageAsset.sale,
                  height: 60,
                  width: 60,
                )),
          if (itemsmodel.itemsDiscount != 0)
            Positioned(
                top: -3,
                left: 61,
                child: Text(
                  translateDataBase("${itemsmodel.itemsDiscount} %",
                      arabicNumber.convert("${itemsmodel.itemsDiscount} %")),
                  style: const TextStyle(
                      fontSize: 30,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold),
                ))
        ],
      ),
    );
  }
}
