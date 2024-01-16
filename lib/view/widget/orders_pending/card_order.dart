import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:project33/controller/orders/pending_controller.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/data/model/ordersmodel.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolor.dart';
import '../../../core/functions/rating.dart';

class CustomPedingCard extends GetView<PendingController> {
  final OrdersModel ordersModel;
  const CustomPedingCard({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //...order number..............................
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  if (ordersModel.ordersStatus == 0)
                    MaterialButton(
                        onPressed: () {
                          Get.defaultDialog(
                              content: const Text(
                                "Do you want to delete the order",
                                style: TextStyle(
                                    fontSize: 20, color: AppColor.primaryColor),
                              ),
                              title: "",
                              onConfirm: () {
                                controller.deleteOrder(
                                    ordersModel.ordersId.toString());
                                controller.onInit();
                                Get.back();
                              },
                              onCancel: () {
                                Get.back();
                              },
                              confirmTextColor: AppColor.white,
                              buttonColor: AppColor.other2Color,
                              cancelTextColor: AppColor.primaryColor);
                        },
                        child: Icon(
                          Icons.delete_forever_outlined,
                          size: 35,
                          color: AppColor.primaryColor,
                        )
                        // Container(
                        //   height: 25,
                        //   width: 80,
                        //   color: AppColor.other3Color,
                        //   child: const Text(
                        //     "Delete",
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //         height: 1.2,
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.bold,
                        //         color: AppColor.other2Color),
                        //   ),
                        // ),
                        ),
                  Text(
                    " ${Jiffy(ordersModel.ordersDatetime).fromNow()}",
                    style: const TextStyle(
                        height: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.other2Color),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Order number :",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColor.other2Color),
                  ),
                  Text(
                    " ${ordersModel.ordersId}",
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColor.other2Color),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),

              //...delivery type..............................
              CustomPendingRow(
                  text1: "delivery type  :",
                  text2: " ${controller.stdeliverytype(ordersModel)}"),

              const SizedBox(
                height: 10,
              ),
              //...delivery price..............................
              CustomPendingRow(
                  text1: "delivery price:",
                  text2: " ${controller.stdeliveryprice(ordersModel)} \$"),

              const SizedBox(
                height: 10,
              ),
              //...ordring price ..............................
              CustomPendingRow(
                  text1: "order price     :",
                  text2: " ${ordersModel.ordersPrice} \$"),
              const SizedBox(
                height: 10,
              ),
              //...order status ..............................
              Row(
                children: [
                  CustomPendingRow(
                      text1: "order status    :",
                      text2: " ${controller.stdeliverystatus(ordersModel)}"),
                  Spacer(),
                  if (ordersModel.ordersStatus == 3 &&
                      ordersModel.ordersComment == "none")
                    MaterialButton(
                      onPressed: () {
                        showratingdialog(
                            context, ordersModel.ordersId.toString());
                      },
                      child: Container(
                        height: 30,
                        width: 80,
                        color: AppColor.other3Color,
                        child: const Text(
                          "Rating",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.2,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: AppColor.white),
                        ),
                      ),
                    ),
                  if (ordersModel.ordersStatus == 3 &&
                      ordersModel.ordersComment != "none")
                    MaterialButton(
                      onPressed: () {
                        Get.bottomSheet(Container(
                          padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                          color: AppColor.grey1,
                          height: 100,
                          child: ListView(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Rating : ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            height: 1.2,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.white),
                                      ),
                                      // Text(
                                      //   "${ordersModel.ordersRate} ",
                                      //   textAlign: TextAlign.center,
                                      //   style: TextStyle(
                                      //       height: 1.2,
                                      //       fontSize: 25,
                                      //       fontWeight: FontWeight.bold,
                                      //       color: AppColor.black,
                                      //       fontFamily: "sans"),
                                      // ),
                                      ...List.generate(
                                          5,
                                          (index) => Icon(
                                                Icons.star,
                                                color: index <
                                                        (ordersModel
                                                            .ordersRate!)
                                                    ? Colors.yellow
                                                    : Colors.white,
                                                size: 25,
                                              ))
                                    ],
                                  ),
                                  Divider(thickness: 5),
                                  Text(
                                    " ${ordersModel.ordersComment}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        height: 1.2,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        color: AppColor.green,
                        child: const Text(
                          "my rating",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.2,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.white),
                        ),
                      ),
                    )
                ],
              ),
              const Divider(thickness: 2),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Total Price :",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.other2Color),
                  ),
                  Text(
                    " ${ordersModel.ordersTotalprice} \$",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.other2Color),
                  ),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.orderdetails, arguments: {
                        "myordersid": ordersModel.ordersId.toString()
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 100,
                      color: AppColor.other3Color,
                      child: const Text(
                        "Details",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.2,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColor.other2Color),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPendingRow extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomPendingRow({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.grey),
        ),
        Text(
          text2,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.grey),
        )
      ],
    );
  }
}
