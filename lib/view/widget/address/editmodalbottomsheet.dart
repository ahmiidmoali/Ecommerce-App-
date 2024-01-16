import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/view/widget/auth/customtextformfieldauth.dart';
import 'package:project33/view/widget/language/custombuttomlang.dart';

import '../../../controller/address/address_view_controller.dart';
import '../../../data/model/addressmodel.dart';

class EditModalBottomSheet extends GetView<AddressViewController> {
  final Function()? onPressed;
  final AddressModel addressModel;
  const EditModalBottomSheet(
      {super.key, required this.addressModel, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        children: [
          Column(
            children: [
              customTextFormAuth(
                  // initialvalue: addressModel.addressName!,
                  lable: "Address Name",
                  hint: "home/work",
                  icon: Icons.home_work_outlined,
                  myController: controller.addressnamecont,
                  isNumber: false),
              customTextFormAuth(
                  // initialvalue: addressModel.addressCity!,
                  lable: "City Name",
                  hint: "Governorate/city",
                  icon: Icons.location_city_outlined,
                  myController: controller.addresscitycont,
                  isNumber: false),
              customTextFormAuth(
                  // initialvalue: addressModel.addressStreet!,
                  lable: "Street Name",
                  hint: "Sr- name and number ",
                  icon: Icons.add_road_outlined,
                  myController: controller.addressstreetcont,
                  isNumber: false),
              customTextFormAuth(
                  // initialvalue: addressModel.addressDetails!,
                  lable: "building detail",
                  hint: "apatment or unit and it's number",
                  icon: Icons.notes_outlined,
                  myController: controller.addressdetailscont,
                  isNumber: false),
              customTextFormAuth(
                  // initialvalue: addressModel.addressPhone!,
                  lable: "mobile nummber",
                  hint: "availabe for recieving the order",
                  icon: Icons.phone_android,
                  myController: controller.addressmobilecont,
                  isNumber: true),
              customButtonLang(
                title: "Apply",
                onPressed: onPressed,
              ),
            ],
          )
        ],
      ),
    );
  }
}
