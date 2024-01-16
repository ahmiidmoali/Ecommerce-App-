import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homescreen_controller.dart';
import 'custombuttonappbar.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            children: [
              ...List.generate(controller.mypages.length + 1, (index) {
                int I = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomButtonAppBar(
                        iconData: controller.iconsList[I],
                        onPressed: () {
                          controller.changePage(I);
                        },
                        name: controller.appbarname[I],
                        colorCase: controller.current == I ? true : false);
              })
            ],
          )),
    );
  }
}
