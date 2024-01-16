import 'package:flutter/material.dart';
import 'package:project33/controller/itemsdetails_controller.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/core/shared/customtextformfield_for_editing.dart';

import '../../core/shared/customtextrich.dart';
import '../widget/itemsdetails/customcoloritemsdetails.dart';
import '../widget/itemsdetails/customimageitemsdetails.dart';
import '../widget/itemsdetails/custompriceitemsdetails.dart';

class itemsDetails extends StatelessWidget {
  const itemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsControllerImp controller = Get.put(ItemsDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: MaterialButton(
            onPressed: () {
              Get.toNamed(AppRoute.cartpage);
            },
            child: const Text(
              "GO To Cart",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const CustomImageItemsDetails(),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              "${controller.itemsmodel.itemsName}",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 25, color: AppColor.largetext),
            ),
          ),
          CustomPriceItemsDetails(
              countwidget: GetBuilder<ItemsDetailsControllerImp>(
                  builder: (controller) => Text(
                        "${controller.countitems}",
                        style: TextStyle(fontSize: 25, height: 1),
                      )),
              addBottun: () {
                controller.add();
              },
              removeBottun: () {
                controller.remove();
              },
              price: controller.itemsmodel.itemsDiscount != 0
                  ? CustomTextRichPrice(
                      why: " ",
                      before: "${controller.itemsmodel.itemsPrice} \$",
                      after:
                          "  ${(controller.itemsmodel.itemsPrice! - controller.itemsmodel.itemsPrice! * controller.itemsmodel.itemsDiscount! / 100)} \$ ")
                  : CustomTextPrice(
                      price: "${controller.itemsmodel.itemsPrice} \$")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${controller.itemsmodel.itemsDesc}",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Color",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 25, color: AppColor.largetext),
            ),
          ),
          const CustomColorItemsDetails(),
          // Text.rich(
          //   TextSpan(
          //     text: 'This item costs ',
          //     children: <TextSpan>[
          //       new TextSpan(
          //         text: '\$8.99',
          //         style: new TextStyle(
          //           fontSize: 25,
          //           color: Colors.black,
          //           decoration: TextDecoration.lineThrough,
          //         ),
          //       ),
          //       new TextSpan(
          //         text: ' \$3.99',
          //         style: new TextStyle(
          //             fontSize: 25,
          //             color: Colors.black,
          //             decoration: TextDecoration.lineThrough,
          //             decorationThickness: 4),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
