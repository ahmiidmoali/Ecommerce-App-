import 'package:flutter/material.dart';
import 'package:project33/controller/favourite_controller.dart';
import 'package:project33/controller/itemspage_controller.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/data/model/itemsmodel.dart';
import 'package:project33/linkapi.dart';
import 'package:project33/view/screen/homepage.dart';
import 'package:project33/view/widget/customappbar.dart';
import 'package:get/get.dart';
import 'package:project33/view/widget/items/customlistcategoriesitemspage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:project33/view/widget/items/customlistproductsitemspage.dart';

class itemsPage extends StatelessWidget {
  const itemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsPageControllerImp controller = Get.put(ItemsPageControllerImp());
    FavouriteController favcontroller = Get.put(FavouriteController());
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ListView(
            children: [
              CustomAppBar(
                pressforsearch: () {
                  controller.doSearch();
                },
                mycontroller: controller.searchcontroller,
                onchanged: (p0) {
                  controller.checkchanges(p0);
                },
                hinttext: "g1".tr, //Find Product
                onpressfavourite: () {
                  Get.toNamed(AppRoute.myfavourite);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<ItemsPageControllerImp>(
                  builder: (controller) => !controller.ischanges
                      ? Column(
                          children: [
                            CustomListCategoriesItemsPage(),
                            handlingDataView(
                                statusRequest: controller.statusRequest!,
                                widget: GridView.builder(
                                    itemCount: controller.data.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: .7),
                                    itemBuilder: (context, index) {
                                      favcontroller.favouriteMap[controller
                                              .data[index]["items_id"]] =
                                          controller.data[index]["favourites"];
                                      return CustomListProductsItemsPage(
                                          itemsmodel: Itemsmodel.fromJson(
                                              controller.data[index]));
                                    }))
                          ],
                        )
                      // :
                      : ListSearchDataitems(itemsmodel: controller.listdata))
            ],
          )),
    );
  }
}

class ListSearchDataitems extends GetView<ItemsPageControllerImp> {
  final List<Itemsmodel> itemsmodel;

  ListSearchDataitems({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.listdata.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          controller.goToItemsDetails(itemsmodel[index]);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          height: 100,
          child: Card(
            color: AppColor.background,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageitems}/${itemsmodel[index].itemsImage}",
                      height: 80,
                      width: 100,
                    )),
                Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text(
                        "${itemsmodel[index].itemsName}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                      subtitle: Text("${itemsmodel[index].categoriesName}"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
