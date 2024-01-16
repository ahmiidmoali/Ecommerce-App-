import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/data/datasource/remote/checkout_data.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/address_data.dart';
import '../data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  String? paymentmethod;
  String? deliverytype;
  String? addressid;
  String? couponid;
  String? orderprice;
  String? coupondiscount;
  MyServices myServices = Get.find();
  List<AddressModel> listdata = [];
  AddressData addressdata = AddressData(Get.find());
  CheckoutData checkoutData = CheckoutData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  getdeliverymethod(val) {
    paymentmethod = val;
    update();
  }

  getdeliverytype(val) {
    deliverytype = val;
    update();
  }

  getdaddressid(val) {
    addressid = val;
    update();
  }

  checkout() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkoutData.Checkout({
      "usersid": myServices.sharedPreferences.getString("id")!,
      if (deliverytype == "1") "addressid": "0",
      if (deliverytype == "0") "addressid": addressid!,
      "orderstype": deliverytype!,
      "deliveryprice": "120",
      "paymentmethod": paymentmethod!,
      "ordersprice": orderprice!,
      "couponsid": couponid!,
      "coupondiscount": coupondiscount
    });
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar("Congratulations", "we recieved your order sucessfully");
      } else {
        Get.defaultDialog(title: "alert", content: Text("error , try again"));
        statusRequest = StatusRequest.failure;
      }
    }
    update();
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

  @override
  void onInit() {
    viewAddress();
    couponid = Get.arguments["couponid"].toString();
    orderprice = Get.arguments["orderprice"].toString();
    coupondiscount = Get.arguments["coupondiscount"].toString();
    super.onInit();
  }
}
