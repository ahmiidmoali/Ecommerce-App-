import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/core/functions/validinput.dart';
import 'package:project33/view/widget/auth/customtextbodyauth.dart';
import 'package:project33/view/widget/auth/customtextformfieldauth.dart';
import 'package:project33/view/widget/auth/customtexttitleauth.dart';
import '../../../../controller/auth/forgetpassword/resetpassword_controller.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../widget/auth/custombuttonauth.dart';

class resetPassword extends StatelessWidget {
  const resetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.background,
        elevation: 0.0,
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => handlingRequestView(
              statusRequest: controller.statusRequest!,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      customTextTitleAuth(text: "48".tr), //"Set New Password"
                      const SizedBox(
                        height: 15,
                      ),
                      customTextBodyAuth(
                          title: "49".tr), //"Must be at least 8 characters"
                      const SizedBox(
                        height: 15,
                      ),
                      customTextFormAuth(
                          isNumber: false,
                          vaild: (val) {
                            return validInput(val!, 5, 13, "password");
                          },
                          myController: controller.password,
                          lable: "50".tr, //"Password"
                          hint: "51".tr, //"Enter your password"
                          icon: Icons.lock_outline_rounded),
                      const SizedBox(
                        height: 10,
                      ),
                      customTextFormAuth(
                          isNumber: false,
                          vaild: (val) {
                            return validInput(val!, 5, 13, "password");
                          },
                          myController: controller.rePassword,
                          lable: "52".tr, //"Confirm Password"
                          hint: "53".tr, //"confirm your password"
                          icon: Icons.lock_outline_rounded),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButtonAuth(
                        text: "54".tr, //"Reset Password"
                        onPressed: () {
                          controller.goToSuccessResetPassword();
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
