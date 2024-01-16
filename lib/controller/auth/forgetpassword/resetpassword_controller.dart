import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/forgetpassword/resetpassword_data.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  ResetPasswordData testData = ResetPasswordData(Get.find());
  StatusRequest? statusRequest = StatusRequest.none;
  String? Email;
  GlobalKey<FormState> formstate = GlobalKey();

  @override
  goToSuccessResetPassword() async {
    var formdate = formstate.currentState;

    if (formdate!.validate()) {
      if (password.value == rePassword.value) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await testData.getData(Email!, password.text);
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response["status"] == "success") {
            Get.offNamed(AppRoute.successResetPassword);
          } else {
            Get.defaultDialog(title: "Alert", middleText: "Try Again");
            statusRequest = StatusRequest.failure;
          }
        }
        update();
        Get.offNamed(AppRoute.successResetPassword);
      } else {
        Get.defaultDialog(title: "Alert", middleText: "not the same password");
        print("not the same password");
      }
    }
  }

  @override
  resetPassword() {}
  @override
  void onInit() {
    Email = Get.arguments["email"];
    password = TextEditingController();
    rePassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();

    super.dispose();
  }
}
