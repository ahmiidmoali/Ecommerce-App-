import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:project33/controller/homepage_controller.dart';
import 'package:get/get.dart';
import 'package:project33/controller/homepageanimate_controller.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/data/model/itemsmodel.dart';
import 'package:project33/linkapi.dart';
import 'package:project33/view/widget/customappbar.dart';
import 'package:project33/view/widget/home/customallads.dart';
import 'package:project33/view/widget/home/customcardhome.dart';
import 'package:project33/view/widget/home/listcategorieshome.dart';
import 'package:project33/view/widget/home/listitemshome.dart';
import '../../controller/favourite_controller.dart';
import '../widget/home/customtitlehome.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp controller = Get.put(HomePageControllerImp());
    Get.put(HomePageAnimateController());
    Get.put(FavouriteController());

    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
              hinttext: "h7".tr //"Find Product"
              ,
              onpressfavourite: () {
                Get.toNamed(AppRoute.myfavourite);
              },
            ),
            handlingDataView(
                statusRequest: controller.statusRequest!,
                widget: !controller.ischanges
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAllAdsColumn(),
                          // if (controller.discounts)
                          //   CustomCardHome(
                          //       title: controller.title,
                          //       body:
                          //           "${controller.body} ${controller.discount}% "),
                          CustomTitleHome(text: "h1".tr), //Categories
                          ListCategoriesHome(),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomTitleHome(text: "h2".tr), //Top Selling
                          ListItemsHome(),
                        ],
                      )
                    : ListSearchData(itemsmodel: controller.listdata))
          ],
        ),
      ),
    );
  }
}

class ListSearchData extends GetView<HomePageControllerImp> {
  final List<Itemsmodel> itemsmodel;

  ListSearchData({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.listdata.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          controller.goToItemsDetails(itemsmodel[index]);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
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
                        style: const TextStyle(
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
