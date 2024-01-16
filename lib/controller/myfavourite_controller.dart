import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/core/services/services.dart';
import 'package:project33/data/datasource/remote/favourite_data.dart';
import 'package:project33/data/datasource/remote/myfavourite_data.dart';
import 'package:project33/data/model/itemsmodel.dart';
import 'package:project33/data/model/myfavouritemodel.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/appcolor.dart';
import '../core/functions/handlingdatacontroller.dart';

abstract class MyFavouruteController extends GetxController {
  initialData();
  getItems();
}

class MyFavouruteControllerImp extends MyFavouruteController {
  List<MyFavouriteModel> data = [];
  MyFavouriteData myFavouriteData = MyFavouriteData(Get.find());
  FavouriteData favouriteData = FavouriteData(Get.find());
  MyServices myServices = Get.find();
  // MyFavouriteModel itemsmodel = MyFavouriteModel();
  StatusRequest? statusRequest;

  @override
  initialData() {
    getItems();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  @override
  @override
  getItems() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await myFavouriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responsedata = response["data"];
        data.addAll(responsedata.map((e) => MyFavouriteModel.fromJson(e)));
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  goToItemsDetails(Itemsmodel itemsmodel) {
    Get.toNamed(AppRoute.itemsdetails, arguments: {"itemsmodel": itemsmodel});
  }

  removeFavourite(String itemid, int favid) {
    favouriteData.removefavourite(
        itemid, myServices.sharedPreferences.getString("id")!);
    data.removeWhere((e) => e.favouritesId == favid);

    update();
  }
}
