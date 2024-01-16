import 'package:get/get.dart';
import 'package:project33/controller/orders/archive_controller.dart';
import 'package:project33/core/services/services.dart';
import 'package:project33/data/datasource/remote/orders/pending_data.dart';
import 'package:project33/data/model/ordersmodel.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

class PendingController extends GetxController {
  List<OrdersModel> data = [];
  MyServices myServices = Get.find();
  PendingData pendingData = PendingData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  stdeliverytype(OrdersModel val) {
    if (val.ordersType == 0) {
      return "Delivery to home";
    } else {
      return "recive it by myself";
    }
  }

  stdeliveryprice(OrdersModel val) {
    if (val.ordersType == 0) {
      return "${val.ordersDeliveryprice}";
    } else {
      return "0";
    }
  }

  stdeliverystatus(OrdersModel val) {
    if (val.ordersStatus == 0) {
      return "waiting for approval";
    } else if (val.ordersStatus == 1) {
      return "order is being perepared";
    } else if (val.ordersStatus == 2) {
      return "on the way";
    } else {
      return "archieve";
    }
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        data.clear();
        List myresponse = response["data"];
        data.addAll(myresponse.map((e) => OrdersModel.fromJson(e)));
      } else {
        // Get.defaultDialog(
        //     title: "Alert", middleText: "This Email Is Not Exist");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteOrder(String ordersid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData.deleteOrder(ordersid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        update();
      } else {
        // Get.defaultDialog(
        //     title: "Alert", middleText: "This Email Is Not Exist");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  rateOrder(String id, String rate, String comment) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData.rateOrder(id, rate, comment);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        await getData();
        // ArchiveController controller = Get.put(ArchiveController());
        // controller.data = data;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
