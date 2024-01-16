import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project33/core/class/statusrequest.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/core/functions/handlingdatacontroller.dart';
import 'package:project33/core/services/services.dart';
import 'package:project33/data/datasource/remote/favourite_data.dart';

class FavouriteController extends GetxController {
  Map favouriteMap = {};
  List data = [];
  MyServices myServices = Get.find();
  FavouriteData favouriteData = FavouriteData(Get.find());
  setFavourite(id, fav) {
    favouriteMap[id] = fav;
    update();
  }

  StatusRequest? statusRequest;
  addFavourite(String itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favouriteData.addfavourite(
        itemid, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
            title: "My Favourites",
            messageText: Text("Added To Favourite List Successfully"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFavourite(String itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favouriteData.removefavourite(
        itemid, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
            backgroundColor: AppColor.grey,
            title: "My Favourites",
            messageText: Text(
              "Deleted From Favourite List Successfully",
              style: TextStyle(color: AppColor.white),
            ));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    // getData();
    super.onInit();
  }
}
