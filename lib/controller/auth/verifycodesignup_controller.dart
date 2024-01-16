import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/verifycodesignup_data.dart';

abstract class verifyCodeSignupControlle extends GetxController {
  checkCode(verificationCode);
  goToVeritySuccessSighUp();
}

class verifyCodeSignupControllerImp extends verifyCodeSignupControlle {
  VerifyCodeSignupData verifyCodeSignupData = VerifyCodeSignupData(Get.find());
  // List data = [];
  StatusRequest? statusRequest = StatusRequest.none;
  String? email;

  @override
  goToVeritySuccessSighUp() {
    Get.offNamed(AppRoute.successsignup);
  }

  @override
  checkCode(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignupData.getData(email!, verificationCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoute.successsignup);

        // update();
        // data.addAll(response["data"]);
      } else {
        Get.defaultDialog(
            title: "Alert", middleText: "Verify Code Not Correct");

        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  resend(email) async {
    verifyCodeSignupData.resend(email);
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
