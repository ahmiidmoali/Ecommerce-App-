import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/cartpage_controller.dart';
import 'package:project33/view/screen/checkout.dart';
import 'package:project33/view/widget/cartpage/customcartbottomsheetbutton.dart';
import 'package:project33/view/widget/homescreen/custombottomappbar.dart';
import 'package:project33/view/widget/language/custombuttomlang.dart';

import '../../../core/constant/appcolor.dart';
import 'customcouponbotton.dart';

class CustomCartBottomNavigatorBar extends GetView<CartPageController> {
  final String price;
  final bool keyoardstate;
  final bool couponDone;
  final String discount;

  final Function(PointerDownEvent)? onTapOutside;
  final Function()? onTapformfield;
  final String totalPrice;
  final TextEditingController? couponController;
  final Function()? onPressedCoupon;

  const CustomCartBottomNavigatorBar(
      {super.key,
      required this.price,
      required this.totalPrice,
      this.couponController,
      this.onPressedCoupon,
      required this.discount,
      this.onTapformfield,
      this.onTapOutside,
      required this.keyoardstate,
      required this.couponDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (couponDone == false)
            Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 2,
                        child: TextFormField(
                          onTapOutside: onTapOutside,
                          onTap: onTapformfield,
                          controller: couponController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        )),
                    Expanded(
                      flex: 1,
                      child: CustomButtonCoupon(
                        title: "apply",
                        onPressed: onPressedCoupon,
                      ),
                    )
                  ],
                ),
                if (keyoardstate == true)
                  const SizedBox(
                    height: 100,
                  ),
              ],
            ),
          if (couponDone == true)
            Container(
              child: Text(
                "Coupon Code (${controller.couponname})",
                style: TextStyle(
                    fontSize: 25,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Price",
                style: TextStyle(color: AppColor.grey1, fontSize: 18),
              ),
              const Spacer(),
              Text(
                price,
                style: const TextStyle(color: AppColor.grey1, fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "discount",
                style: TextStyle(color: AppColor.grey1, fontSize: 18),
              ),
              const Spacer(),
              Text(
                discount,
                style: const TextStyle(color: AppColor.grey1, fontSize: 20),
              ),
            ],
          ),
          const Divider(thickness: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Total Price",
                style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                totalPrice,
                style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CustomCartBottomSheetButton(
            title: "Place Order",
            onPressed: () {
              controller.getToCheckout();
            },
          )
        ],
      ),
    );
  }
}
