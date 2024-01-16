import 'package:get/get.dart';
import 'package:project33/core/class/statusrequest.dart';
import 'package:project33/core/functions/handlingdatacontroller.dart';
import 'package:project33/data/datasource/remote/test_data.dart';

class TestController extends GetxController {
  List data = [];
  TestData testData = TestData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await testData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        data.addAll(response["data"]);
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
