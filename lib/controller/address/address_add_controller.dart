import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/data/datasource/remote/address_data.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';

class AddressAddController extends GetxController {
  MyServices myServices = Get.find();
  AddressData addressdata = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController? addressnamecont;
  TextEditingController? addresscitycont;
  TextEditingController? addressstreetcont;
  TextEditingController? addressdetailscont;
  TextEditingController? addressmobilecont;

  @override
  void onInit() {
    addressnamecont = TextEditingController();
    addresscitycont = TextEditingController();
    addressstreetcont = TextEditingController();
    addressdetailscont = TextEditingController();
    addressmobilecont = TextEditingController();

    super.onInit();
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressdata.addData(
        myServices.sharedPreferences.getString("id")!,
        addressnamecont!.text,
        addresscitycont!.text,
        addressstreetcont!.text,
        addressdetailscont!.text,
        addressmobilecont!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoute.addressview);
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
