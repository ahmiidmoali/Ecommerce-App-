import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/data/datasource/remote/auth/signup_data.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class SignUpController extends GetxController {
  SignUP();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController Username;
  late TextEditingController Email;
  late TextEditingController Mobile;
  late TextEditingController Password;
  GlobalKey<FormState> formstate = GlobalKey();
  SignupData signupData = SignupData(Get.find());
  // List data = [];
  StatusRequest? statusRequest = StatusRequest.none;
  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  SignUP() async {
    var formdate = formstate.currentState;
    if (formdate!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.getData(
          Username.text, Email.text, Password.text, Mobile.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          // data.addAll(response["data"]);
          Get.offAllNamed(AppRoute.verifysignup,
              arguments: {"email": Email.text});
        } else {
          Get.defaultDialog(
              title: "Alert", middleText: "Phone or Email is already used");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("not vaild");
    }
  }

  @override
  void onInit() {
    Username = TextEditingController();
    Email = TextEditingController();
    Mobile = TextEditingController();
    Password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    Username.dispose();
    Email.dispose();
    Mobile.dispose();
    Password.dispose();
    super.dispose();
  }
}
