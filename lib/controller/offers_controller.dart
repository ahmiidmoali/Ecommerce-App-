import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/homepage_controller.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/core/services/services.dart';
import 'package:project33/data/datasource/remote/itemspage_data.dart';
import 'package:project33/data/model/itemsmodel.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/datasource/remote/offers_data.dart';

class OffersPageControllerImp extends SearchDataController {
  List data = [];

  OffersData offersData = OffersData(Get.find());
  MyServices myServices = Get.find();
  Itemsmodel itemsmodel = Itemsmodel();

  initialData() {
    getItems();
    searchcontroller = TextEditingController();
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
    var response =
        await offersData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List mydata = response["data"];
        data.addAll(response["data"]);
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  @override
  goToItemsDetails(Itemsmodel itemsmodel) {
    Get.toNamed(AppRoute.itemsdetails, arguments: {"itemsmodel": itemsmodel});
  }

  Favouriteitems() {
    if (itemsmodel.favourites == 1) {
    } else {}
  }
}
