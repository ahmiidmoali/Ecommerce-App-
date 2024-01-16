import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/core/constant/routes.dart';
import '../../controller/homescreen_controller.dart';
import '../widget/homescreen/custombottomappbar.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.background,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          child: const Icon(
            Icons.shopping_basket_outlined,
          ),
          onPressed: () {
            Get.toNamed(AppRoute.cartpage);
          },
        ),
        bottomNavigationBar: const CustomBottomAppBar(),
        body: GetBuilder<HomeScreenControllerImp>(
          builder: (controller) {
            return WillPopScope(
              child: controller.mypages.elementAt(controller.current),
              onWillPop: () {
                return controller.exetfromapp();
              },
            );
          },
        ),
      ),
    );
  }
}
