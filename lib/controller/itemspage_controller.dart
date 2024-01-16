import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/homepage_controller.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/core/services/services.dart';
import 'package:project33/data/datasource/remote/itemspage_data.dart';
import 'package:project33/data/model/itemsmodel.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';

abstract class ItemsPageController extends SearchDataController {
  initialData();
  changeCat(val, id);
  getItems(String idCat);
}

class ItemsPageControllerImp extends ItemsPageController {
  List data = [];
  ItemsPageData itemPageData = ItemsPageData(Get.find());
  MyServices myServices = Get.find();
  Itemsmodel itemsmodel = Itemsmodel();
  List categories = [];
  String? idCat;
  String? userid;
  int? selectedCat;
  @override
  initialData() {
    categories = Get.arguments["categories"];
    selectedCat = Get.arguments["selectedCat"];
    idCat = Get.arguments["idCat"];
    userid = myServices.sharedPreferences.getString("id");
    getItems(idCat!);
    searchcontroller = TextEditingController();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  @override
  changeCat(val, id) {
    selectedCat = val;
    idCat = id;
    getItems(idCat!);

    update();
  }

  @override
  getItems(idCat) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemPageData.getData(idCat, userid!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
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
