import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/data/datasource/remote/forgetpassword/checkemail_data.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handlingdatacontroller.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVerityEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest? statusRequest = StatusRequest.none;
  late TextEditingController Email;
  GlobalKey<FormState> formstate = GlobalKey();

  @override
  goToVerityEmail() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.getData(Email.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoute.verifyCode, arguments: {"email": Email.text});
        } else {
          Get.defaultDialog(
              title: "Alert", middleText: "This Email Is Not Exist");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  checkEmail() {}

  @override
  void onInit() {
    Email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    Email.dispose();

    super.dispose();
  }
}
