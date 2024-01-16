import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/data/model/itemsmodel.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/appcolor.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cart_data.dart';

abstract class ItemsDetailsController extends GetxController {
  intialdata();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  StatusRequest? statusRequest;
  late Itemsmodel itemsmodel;
  int countitems = 0;
  // int itemprice=itemsmodel.itemsPrice!;

  // int totalprice() {
  //   return ()
  // }

  @override
  void onInit() {
    intialdata();
    super.onInit();
  }

  @override
  intialdata() async {
    itemsmodel = Get.arguments["itemsmodel"];
    countitems = await getcountitems(itemsmodel.itemsId.toString());
    update();
  }

  List color = [
    {"id": "1", "name": "Silver", "active": 0},
    {"id": "2", "name": "Black", "active": 1},
    {"id": "3", "name": "Blue", "active": 0}
  ];
  addCart(String itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        itemid, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        // Get.rawSnackbar(
        //     title: "My Favourites",
        //     messageText: Text("Added To Cart Successfully"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  add() async {
    await addCart(itemsmodel.itemsId.toString());
    await intialdata();
    update();
  }

  remove() async {
    await removeCart(itemsmodel.itemsId.toString());
    await intialdata();
    update();
  }

  removeCart(String itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        itemid, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        // Get.rawSnackbar(
        //     backgroundColor: AppColor.grey,
        //     title: "My Favourites",
        //     messageText: const Text(
        //       "Deleted From cart Successfully",
        //       style: TextStyle(color: AppColor.white),
        //     ));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getcountitems(String itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getcountitems(
        itemid, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        countitems = response["data"];
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
