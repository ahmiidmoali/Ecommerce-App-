import 'package:get/get.dart';
import 'package:project33/controller/orders/pending_controller.dart';
import 'package:project33/core/services/services.dart';
import 'package:project33/data/datasource/remote/orders/pending_data.dart';
import 'package:project33/data/model/ordersmodel.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

class ArchiveController extends GetxController {
  late List<OrdersModel> data;

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

  getinitial() {
    PendingController controller = Get.find();
    data = controller.data;
  }

  @override
  void onInit() async {
    await getinitial();
    // data = Get.arguments["datatoarchive"];

    super.onInit();
  }
}
