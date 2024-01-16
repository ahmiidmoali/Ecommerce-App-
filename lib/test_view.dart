import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/test_controller.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/constant/appcolor.dart';

class testView extends StatelessWidget {
  const testView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text("text view"),
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          return handlingDataView(
              statusRequest: controller.statusRequest!,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Text("${controller.data}");
                },
              ));
        },
      ),
    );
  }
}
