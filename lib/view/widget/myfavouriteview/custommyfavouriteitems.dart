import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/myfavourite_controller.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/data/model/itemsmodel.dart';
import 'package:project33/data/model/myfavouritemodel.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../linkapi.dart';

class CustomMyFavouriteItems extends GetView<MyFavouruteControllerImp> {
  final MyFavouriteModel itemsmodel;

  const CustomMyFavouriteItems({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItemsDetails(itemsmodel2);
      },
      child: Card(
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
                  imageUrl: "${AppLink.imageitems}/${itemsmodel.itemsImage!}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                "${translateDataBase(itemsmodel.itemsName, itemsmodel.itemsNameAr)}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text("Rating 4.0"),
                  const SizedBox(
                    width: 5,
                  ),
                  ...List.generate(
                      5,
                      (index) => const Icon(
                            Icons.star,
                            size: 18,
                          ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${itemsmodel.itemsPrice} \$",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColor.primaryColor,
                        fontFamily: "sans"),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.removeFavourite(
                            itemsmodel.itemsId.toString(),
                            itemsmodel.favouritesId!);
                      },
                      icon: Icon(Icons.delete))
                ],
              )
            ]),
      ),
    );
  }
}
