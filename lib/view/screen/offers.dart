import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/data/model/itemsmodel.dart';
import 'package:project33/linkapi.dart';
import 'package:project33/view/widget/customappbar.dart';
import '../../controller/favourite_controller.dart';
import '../../controller/itemspage_controller.dart';
import '../../controller/offers_controller.dart';
import '../widget/items/customlistproductsitemspage.dart';
import '../widget/offers/customlistproductsitemspage.dart';

class offersPage extends StatelessWidget {
  const offersPage({super.key});

  @override
  Widget build(BuildContext context) {
    OffersPageControllerImp controller = Get.put(OffersPageControllerImp());
    FavouriteController favcontroller = Get.put(FavouriteController());

    return GetBuilder<OffersPageControllerImp>(
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
              hinttext: "Find Product",
              onpressfavourite: () {
                Get.toNamed(AppRoute.myfavourite);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            handlingDataView(
                statusRequest: controller.statusRequest!,
                widget: !controller.ischanges
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          favcontroller.favouriteMap[controller.data[index]
                                  ["items_id"]] =
                              controller.data[index]["favourites"];
                          return CustomListOffersItemsPage(
                              itemsmodel:
                                  Itemsmodel.fromJson(controller.data[index]));
                        })
                    : ListSearchData(itemsmodel: controller.listdata))
          ],
        ),
      ),
    );
  }
}

class ListSearchData extends GetView<OffersPageControllerImp> {
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
