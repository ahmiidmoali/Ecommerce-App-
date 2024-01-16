import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/cartpage_controller.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/view/widget/cartpage/cartbottomnavigatorbar.dart';
import 'package:project33/view/widget/cartpage/cartitemscard.dart';
import 'package:project33/view/widget/cartpage/topcartcard.dart';

class cartPage extends StatelessWidget {
  const cartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartPageController());
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "My Cart",
            style: TextStyle(color: AppColor.grey1, fontSize: 25),
          ),
          elevation: 0,
          backgroundColor: AppColor.background,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColor.black,
              ))),
      bottomNavigationBar: GetBuilder<CartPageController>(
        builder: (controller) => CustomCartBottomNavigatorBar(
            couponDone: controller.couponDone,
            keyoardstate: controller.usingkeyboard,
            discount: "${(controller.coupondiscount)}%",
            couponController: controller.couponController,
            onPressedCoupon: () {
              controller.checkCoupon(controller.couponController!.text);
            },
            onTapformfield: () {
              controller.keyboardtyping(true);
            },
            onTapOutside: (p0) {
              controller.keyboardtyping(false);
            },
            price: " ${controller.totalprice} \$",
            totalPrice: " ${(controller.totalpriceequation())} \$ "),
      ),
      body: GetBuilder<CartPageController>(
        builder: (controller) => handlingDataView(
            statusRequest: controller.statusRequest!,
            widget: ListView(
              children: [
                CustomCartTopCard(
                    body:
                        "You have ${controller.totalitems} items in your list"),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => CustomCartItemsCard(
                      addbutton: () {
                        controller
                            .add(controller.data[index].itemsId.toString());
                      },
                      removebutton: () {
                        controller
                            .remove(controller.data[index].itemsId.toString());
                      },
                      imagename: controller.data[index].itemsImage!,
                      itemsname: controller.data[index].itemsName!,
                      itemsPrice: "${controller.data[index].itemsprice!} \$",
                      howmany: "${controller.data[index].itemscount!}"),
                )
              ],
            )),
      ),
    );
  }
}
