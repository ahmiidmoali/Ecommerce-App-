import 'package:flutter/material.dart';
import 'package:project33/view/widget/home/customadshome.dart';
import 'package:get/get.dart';

import '../../../controller/homepageanimate_controller.dart';
import '../../../core/constant/appcolor.dart';

class CustomAllAdsColumn extends StatelessWidget {
  const CustomAllAdsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: AppColor.background,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "CIB Credit card",
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor),
                  onPressed: () {},
                  child: const Text("apply now"))
            ],
          ),
        ),
        GetBuilder<HomePageAnimateController>(
          builder: (controller) => InkWell(
            onTap: () {
              controller.takeaction();
            },
            child: Container(
                height: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomAds1(
                                imagename: controller.myimage,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 1,
                        right: 1,
                        child: Container(
                          color: AppColor.background,
                          child: const Text(
                            "sponsored",
                            style: TextStyle(fontSize: 15),
                          ),
                        )),
                    Positioned(
                        bottom: 20,
                        child: Row(
                          children: [
                            ...List.generate(
                              controller.myadsdata.length,
                              (index) => Container(
                                margin: const EdgeInsets.only(right: 4),
                                height: 8,
                                width: 30,
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.black),
                                    color: controller.myindex == index
                                        ? AppColor.primaryColor
                                        : AppColor.white,
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            )
                          ],
                        )),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
