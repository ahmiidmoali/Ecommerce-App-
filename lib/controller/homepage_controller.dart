import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project33/core/class/statusrequest.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/core/services/services.dart';
import 'package:project33/data/datasource/remote/home_data.dart';
import 'package:project33/data/model/itemsmodel.dart';
import 'package:project33/data/model/topsellingmodel.dart';

import '../core/functions/handlingdatacontroller.dart';

abstract class HomePageController extends SearchDataController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, String idCat);
}

class HomePageControllerImp extends HomePageController {
  // int currentpage = 0;
  // late PageController pageController;
  List myadsdata = [
    {"ads_id": 0, "ads_image": "logo.png", "ads_type": 0, "ads_content": "0"}
  ];
  List ads = [];
  String title = "there are no";
  String body = "discounts now";
  String discount = "0";
  bool discounts = true;
  MyServices myServices = Get.find();
  String? username;
  List categories = [];
  List catlabtop = [];
  List items = [];
  List settings = [];
  List<TopSellingModel> topselling = [];
  List<Itemsmodel> topselling2 = [];
  late String lang;
  HomeData homeData = HomeData(Get.find());
  StatusRequest? statusRequest = StatusRequest.none;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    lang = myServices.sharedPreferences.getString("lang")!;
    searchcontroller = TextEditingController();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await homeData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        items.clear();
        categories.clear();

        categories.addAll(response["categories"]);

        items.addAll(response["items"]);
        List tops = response["topselling"];
        topselling.addAll(tops.map((e) => TopSellingModel.fromJson(e)));
        topselling2.addAll(tops.map((e) => Itemsmodel.fromJson(e)));
        List newitems = response["items"];
        catlabtop.addAll(newitems.map((e) => e["items_categories"] == 1));
        if (response["settings"] != null) {
          settings.addAll(response["settings"]);
          title = response["settings"][0]["settings_title"];
          body = response["settings"][0]["settings_body"];
          discount = response["settings"][0]["settings_discount"].toString();
        } else {
          discounts = false;
        }
        if (response["ads"] != null) {
          ads.addAll(response["ads"]);
          myadsdata.addAll(ads);
          print("===========================================================");
          print(myadsdata);
          print("===========================================================");
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  goToItems(List categories, int selectedCat, String idCat) {
    Get.toNamed(AppRoute.itemspage, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "idCat": idCat
    });
  }
}

class SearchDataController extends GetxController {
  List<Itemsmodel> listdata = [];
  TextEditingController? searchcontroller;

  HomeData homeData = HomeData(Get.find());
  StatusRequest? statusRequest = StatusRequest.none;
  bool ischanges = false;
  checkchanges(val) {
    if (val == "") {
      ischanges = false;
    }
    statusRequest = StatusRequest.none;
    update();
  }

  doSearch() async {
    statusRequest = StatusRequest.none;
    ischanges = true;
    await searchData(searchcontroller!.text);
    update();
  }

  goToItemsDetails(Itemsmodel itemsmodel) {
    Get.toNamed(AppRoute.itemsdetails, arguments: {"itemsmodel": itemsmodel});
  }

  searchData(String search) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.searchData(search);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        listdata.clear();
        List myresponse = response['data'];
        listdata.addAll(myresponse.map((e) => Itemsmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  topSellinggoToItemsDetails(TopSellingModel topSellingModel) {
    Get.toNamed(AppRoute.itemsdetails,
        arguments: {"itemsmodel": topSellingModel});
  }
}
