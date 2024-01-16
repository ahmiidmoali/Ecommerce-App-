import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/auth/forgetpassword/forgetPassword_controller.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/core/functions/validinput.dart';
import 'package:project33/view/widget/auth/customtextbodyauth.dart';
import 'package:project33/view/widget/auth/customtextformfieldauth.dart';
import 'package:project33/view/widget/auth/customtexttitleauth.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../widget/auth/custombuttonauth.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "40".tr, //"Forget Password"
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
        backgroundColor: AppColor.background,
        elevation: 0.0,
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
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
                      customTextTitleAuth(
                          text: "41".tr), //"Enter Email Address"
                      const SizedBox(
                        height: 15,
                      ),
                      customTextBodyAuth(
                          title:
                              "42".tr), //"the Email that used with signing up"
                      const SizedBox(
                        height: 15,
                      ),
                      customTextFormAuth(
                          isNumber: false,
                          vaild: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          myController: controller.Email,
                          lable: "43".tr, //"Email"
                          hint: "44".tr, //"Enter your email"
                          icon: Icons.email_outlined),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButtonAuth(
                        text: "45".tr, //"Send"
                        onPressed: () {
                          controller.goToVerityEmail();
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
