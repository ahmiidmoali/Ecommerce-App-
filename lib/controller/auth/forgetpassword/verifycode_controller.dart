import 'package:get/get.dart';
import 'package:project33/core/class/statusrequest.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/data/datasource/remote/forgetpassword/verifycode_data.dart';

import '../../../core/functions/handlingdatacontroller.dart';

abstract class VerifyCodeController extends GetxController {
  goToResetPassword(verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeFData testData = VerifyCodeFData(Get.find());
  StatusRequest? statusRequest = StatusRequest.none;
  String? Email;
  @override
  goToResetPassword(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await testData.getData(Email!, verifyCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": Email});
      } else {
        Get.defaultDialog(title: "Alert", middleText: "Wrong Code");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  @override
  void onInit() {
    Email = Get.arguments["email"];
    super.onInit();
  }
}
