import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/class/statusrequest.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/core/functions/handlingdatacontroller.dart';
import 'package:project33/core/services/services.dart';
import 'package:project33/data/datasource/remote/cart_data.dart';
import 'package:project33/data/model/cartviewmodel.dart';
import 'package:project33/data/model/couponmodel.dart';

class CartPageController extends GetxController {
  CouponModel? couponModel;
  List<CartViewModel> data = [];
  int countitems = 0;
  TextEditingController? couponController;
  String? couponname;
  int coupondiscount = 0;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  double totalprice = 0.0;
  int totalitems = 0;
  bool usingkeyboard = false;
  bool couponDone = false;
  String? couponid;

  StatusRequest? statusRequest;
  @override
  void onInit() async {
    await initalData();
    super.onInit();
  }

  initalData() async {
    await viewCart();
    couponController = TextEditingController();

    update();
  }

  getToCheckout() {
    if (data.isEmpty) {
      return Get.snackbar("Cart is empty", "Please add somting first");
    }
    Get.toNamed(AppRoute.checkout, arguments: {
      "orderprice": totalprice,
      "couponid": couponid ?? "0",
      "coupondiscount": coupondiscount
    });
  }

  totalpriceequation() {
    return (totalprice - totalprice * coupondiscount / 100);
  }

  keyboardtyping(val) {
    usingkeyboard = val;
    update();
  }

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

  removedata() {
    data.clear();
    totalprice = 0.0;
    totalitems = 0;
  }

  refreshdata() {
    removedata();
    viewCart();
  }

  add(itemsid) async {
    await addCart(itemsid);
    refreshdata();
    update();
  }

  remove(itemsid) async {
    await removeCart(itemsid);
    refreshdata();
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

  viewCart() async {
    statusRequest = StatusRequest.loading;

    data.clear;

    update();
    var response =
        await cartData.viewcart(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        if (response["data"] != null) {
          List responsedata = response["data"];
          data.addAll(responsedata.map((e) => CartViewModel.fromJson(e)));
        }

        Map responsetotal = response["datatotal"];
        if (responsetotal["totalprice"] != null) {
          totalprice = double.parse(responsetotal["totalprice"].toString());
          totalitems = int.parse(responsetotal["totalitems"].toString());
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkCoupon(String nameofcoupon) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkcoupon(nameofcoupon);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Map<String, dynamic> responsedata = response["data"];

        couponModel = CouponModel.fromJson(responsedata);
        couponname = couponModel!.couponName.toString();
        couponid = couponModel!.couponId.toString();
        coupondiscount = couponModel!.couponDiscount!;
        couponDone = true;
      } else {
        Get.snackbar(
            "wrong coupon", "please recheck your copoun and try again");
        coupondiscount = 0;
        couponDone = false;
      }
    }
    update();
  }
}
