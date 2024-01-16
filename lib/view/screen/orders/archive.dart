import 'package:flutter/material.dart';
import 'package:project33/controller/orders/archive_controller.dart';
import 'package:project33/controller/orders/pending_controller.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/view/widget/orders_pending/card_order.dart';

class archiveorders extends StatefulWidget {
  const archiveorders({super.key});

  @override
  State<archiveorders> createState() => _archiveordersState();
}

class _archiveordersState extends State<archiveorders> {
  @override
  Widget build(BuildContext context) {
    ArchiveController controller = Get.put(ArchiveController());
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text(
          "Archive",
          style: TextStyle(
            fontSize: 20,
            color: AppColor.white,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<ArchiveController>(
          builder: (controller) => ListView(
                children: [
                  ...List.generate(
                      controller.data.length,
                      (index) => controller.data[index].ordersStatus == 3
                          ? CustomPedingCard(
                              ordersModel: controller.data[index])
                          : Container(
                              height: 0,
                            ))
                ],
              )),
    );
  }
}
