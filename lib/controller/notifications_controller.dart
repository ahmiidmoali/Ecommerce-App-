import 'package:get/get.dart';
import 'package:project33/core/class/statusrequest.dart';
import 'package:project33/core/functions/handlingdatacontroller.dart';
import 'package:project33/core/services/services.dart';
import 'package:project33/data/datasource/remote/notifications_data.dart';
import 'package:project33/data/model/notificationsmodel.dart';

class NotificationsController extends GetxController {
  List<NotificationsModel> data = [];
  NotificationData notificationData = NotificationData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        data.clear();
        List dataresponse = response["data"];
        data.addAll(dataresponse.map((e) => NotificationsModel.fromJson(e)));
      } else {
        // Get.defaultDialog(
        //     title: "Alert", middleText: "This Email Is Not Exist");
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
