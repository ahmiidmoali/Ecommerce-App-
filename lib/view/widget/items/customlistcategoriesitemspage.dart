import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/itemspage_controller.dart';
import 'package:project33/core/constant/appcolor.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../data/model/categoriesmodel.dart';

class CustomListCategoriesItemsPage extends GetView<ItemsPageControllerImp> {
  const CustomListCategoriesItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ListCategories(
                I: index,
                categoriesmodel:
                    Categoriesmodel.fromJson(controller.categories[index]));
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 4,
            );
          },
          itemCount: controller.categories.length),
    );
  }
}

class ListCategories extends GetView<ItemsPageControllerImp> {
  final int I;
  final Categoriesmodel categoriesmodel;
  const ListCategories(
      {super.key, required this.categoriesmodel, required this.I});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(I, categoriesmodel.categoriesId.toString());
      },
      child: GetBuilder<ItemsPageControllerImp>(
        builder: (controller) => Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              border: controller.selectedCat == I
                  ? const Border(
                      bottom:
                          BorderSide(width: 4, color: AppColor.primaryColor))
                  : null),
          child: Text(
            "${translateDataBase(categoriesmodel.categoriesName, categoriesmodel.categoriesNameAr)}",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
