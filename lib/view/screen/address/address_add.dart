import 'package:flutter/material.dart';
import 'package:project33/controller/address/address_add_controller.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/view/widget/auth/customtextformfieldauth.dart';
import 'package:get/get.dart';
import 'package:project33/view/widget/language/custombuttomlang.dart';

class addressadd extends StatelessWidget {
  const addressadd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressAddController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('Address Details'),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: GetBuilder<AddressAddController>(
            builder: (controller) => handlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Column(
                    children: [
                      customTextFormAuth(
                          lable: "Address Name",
                          hint: "home/work",
                          icon: Icons.home_work_outlined,
                          myController: controller.addressnamecont,
                          isNumber: false),
                      customTextFormAuth(
                          lable: "City Name",
                          hint: "Governorate/city",
                          icon: Icons.location_city_outlined,
                          myController: controller.addresscitycont,
                          isNumber: false),
                      customTextFormAuth(
                          lable: "Street Name",
                          hint: "Sr- name and number ",
                          icon: Icons.add_road_outlined,
                          myController: controller.addressstreetcont,
                          isNumber: false),
                      customTextFormAuth(
                          lable: "building detail",
                          hint: "apatment or unit and it's number",
                          icon: Icons.notes_outlined,
                          myController: controller.addressdetailscont,
                          isNumber: false),
                      customTextFormAuth(
                          lable: "mobile nummber",
                          hint: "availabe for recieving the order",
                          icon: Icons.phone_android,
                          myController: controller.addressmobilecont,
                          isNumber: true),
                      customButtonLang(
                        title: "Add",
                        onPressed: () {
                          controller.addAddress();
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
