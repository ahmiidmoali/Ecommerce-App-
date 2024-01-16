import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/checkout_controller.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/core/constant/imageasset.dart';
import 'package:project33/view/widget/checkout/customaddresscard.dart';
import 'package:project33/view/widget/checkout/custombuttomcheckout.dart';
import 'package:project33/view/widget/checkout/customimage.dart';
import 'package:project33/view/widget/checkout/customtext.dart';
import 'package:project33/view/widget/language/custombuttomlang.dart';

class checkOut extends StatefulWidget {
  const checkOut({super.key});

  @override
  State<checkOut> createState() => _checkOutState();
}

class _checkOutState extends State<checkOut> {
  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Checkout",
            style: TextStyle(
                fontSize: 25,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: customButtonCheckout(
          title: "Checkout",
          onPressed: () {
            if (controller.deliverytype == null) {
              return Get.defaultDialog(
                  title: "alert",
                  content: Text("choose the delivery type first"));
            }
            if (controller.paymentmethod == null) {
              return Get.defaultDialog(
                  title: "alert",
                  content: Text("choose the paymentmethod first"));
            }
            if (controller.deliverytype == "0" &&
                controller.addressid == null) {
              return Get.defaultDialog(
                  title: "alert", content: Text("choose the address first"));
            }
            controller.checkout();
          },
        ),
        body: GetBuilder<CheckoutController>(
          builder: (controller) => Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //.........Check payment method...........
                    const Text(
                      "Check payment method",
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),

                    CustomTextCheckout(
                      text: "cash",
                      isactive: controller.paymentmethod == "0" ? true : false,
                      onTap: () {
                        controller.getdeliverymethod("0");
                      },
                    ),

                    CustomTextCheckout(
                      text: "card",
                      isactive: controller.paymentmethod == "1" ? true : false,
                      onTap: () {
                        controller.getdeliverymethod("1");
                      },
                    ),

                    //..................Choose Delivery Type........................
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Choose Delivery Type",
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomImageCheckout(
                          imagetext: "home delivery",
                          imagename: AppImageAsset.deliveryd,
                          isactive:
                              controller.deliverytype == "0" ? true : false,
                          onTap: () {
                            controller.getdeliverytype("0");
                          },
                        ),
                        CustomImageCheckout(
                          imagetext: "Get it by youself",
                          imagename: AppImageAsset.drivethrud,
                          isactive:
                              controller.deliverytype == "1" ? true : false,
                          onTap: () {
                            controller.getdeliverytype("1");
                          },
                        ),
                      ],
                    ),

                    //................."Shipping Address....................
                    SizedBox(
                      height: 30,
                    ),
                    if (controller.deliverytype == "0")
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Shipping Address",
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ...List.generate(
                              controller.listdata.length,
                              (index) => CustomCardCheckout(
                                    isactive: controller
                                                .listdata[index].addressId
                                                .toString() ==
                                            controller.addressid
                                        ? true
                                        : false,
                                    addressModel: controller.listdata[index],
                                    onTap: () {
                                      controller.getdaddressid(controller
                                          .listdata[index].addressId
                                          .toString());
                                    },
                                  ))
                        ],
                      ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
