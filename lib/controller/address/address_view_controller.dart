import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/data/model/addressmodel.dart';
import 'package:project33/view/screen/address/address_add.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/address_data.dart';

class AddressViewController extends GetxController {
  TextEditingController? addressnamecont;
  TextEditingController? addresscitycont;
  TextEditingController? addressstreetcont;
  TextEditingController? addressdetailscont;
  TextEditingController? addressmobilecont;

  MyServices myServices = Get.find();
  List<AddressModel> listdata = [];
  AddressData addressdata = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  @override
  void onInit() {
    viewAddress();
    super.onInit();
  }

  viewAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressdata
        .viewData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        listdata.clear();
        List dataresponse = response["data"];
        listdata.addAll(dataresponse.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteAddress(String addressid, int id) {
    addressdata.deleteData(addressid);
    listdata.removeWhere((element) => element.addressId == id);
    update();
  }

  editAddress(String addressid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressdata.editData(
        addressid,
        addressnamecont!.text,
        addresscitycont!.text,
        addressstreetcont!.text,
        addressdetailscont!.text,
        addressmobilecont!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        viewAddress();
        Get.back();
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
