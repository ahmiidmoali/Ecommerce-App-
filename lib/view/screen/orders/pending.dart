import 'package:flutter/material.dart';
import 'package:project33/controller/orders/pending_controller.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/view/widget/orders_pending/card_order.dart';

class pendingorders extends StatefulWidget {
  const pendingorders({super.key});

  @override
  State<pendingorders> createState() => _pendingordersState();
}

class _pendingordersState extends State<pendingorders> {
  @override
  Widget build(BuildContext context) {
    PendingController controller = Get.put(PendingController());
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Row(
          children: [
            const Text("Current Orders"),
            const Spacer(),
            MaterialButton(
                onPressed: () {
                  Get.toNamed(AppRoute.orderarchive,
                      arguments: {"datatoarchive": controller.data});
                },
                child: Row(
                  children: const [
                    Text(
                      "Archive",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColor.white,
                      ),
                    ),
                    Icon(
                      Icons.archive_outlined,
                      size: 35,
                      color: AppColor.white,
                    )
                  ],
                )),
          ],
        ),
        centerTitle: true,
      ),
      body: GetBuilder<PendingController>(
        builder: (controller) => handlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                ...List.generate(
                    controller.data.length,
                    (index) => controller.data[index].ordersStatus != 3
                        ? CustomPedingCard(ordersModel: controller.data[index])
                        : Container(
                            height: 0,
                          ))
              ],
            )),
      ),
    );
  }
}
