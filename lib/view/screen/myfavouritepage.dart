import 'package:flutter/material.dart';
import 'package:project33/controller/myfavourite_controller.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/data/model/myfavouritemodel.dart';
import 'package:project33/view/widget/myfavouriteview/custommyfavouriteitems.dart';
import '../widget/customappbar.dart';
import 'package:get/get.dart';

class myFavouritePage extends StatelessWidget {
  const myFavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    MyFavouruteControllerImp controller = Get.put(MyFavouruteControllerImp());
    return Scaffold(
      body: ListView(children: [
        // CustomAppBar(
        //   hinttext: "Find Product",
        //   onpressfavourite: () {},
        // ),
        GetBuilder<MyFavouruteControllerImp>(
          builder: (controller) => handlingDataView(
              statusRequest: controller.statusRequest!,
              widget: GridView.builder(
                  itemCount: controller.data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .7),
                  itemBuilder: (context, index) {
                    return CustomMyFavouriteItems(
                        itemsmodel: controller.data[index]);
                  })),
        )
      ]),
    );
  }
}
