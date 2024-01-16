import 'package:flutter/material.dart';

import 'package:project33/controller/auth/login_controller.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/class/statusrequest.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/core/functions/alertexitapp.dart';
import 'package:project33/core/functions/validinput.dart';

import 'package:project33/view/widget/auth/customtextbodyauth.dart';
import 'package:project33/view/widget/auth/customtextformfieldauth.dart';
import 'package:project33/view/widget/auth/customtextlogin&signup.dart';
import 'package:project33/view/widget/auth/customtexttitleauth.dart';
import 'package:project33/view/widget/auth/logoauth.dart';
import 'package:get/get.dart';
import '../../widget/auth/custombuttonauth.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogInControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "10".tr, //"Sign in"
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
        backgroundColor: AppColor.background,
        elevation: 0.0,
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LogInControllerImp>(
            builder: (controller) => handlingRequestView(
                statusRequest: controller.statusRequest!,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        const logoAuth(),
                        customTextTitleAuth(text: "11".tr), //"Welcome Back"
                        customTextBodyAuth(
                            title: "12"
                                .tr), //"Sign in with your email and password\nor continue with social media"
                        const SizedBox(
                          height: 15,
                        ),
                        customTextFormAuth(
                            isNumber: false,
                            vaild: (val) {
                              return validInput(val!, 5, 100, "email");
                            },
                            myController: controller.Email,
                            lable: "13".tr, //"Email"
                            hint: "14".tr, //"Enter your email"
                            icon: Icons.email_outlined),
                        GetBuilder<LogInControllerImp>(
                          builder: (controller) => customTextFormAuth(
                              obscureText: controller.isShowedText,
                              onPressedIcon: () {
                                controller.changeShowedText();
                              },
                              isNumber: false,
                              vaild: (val) {
                                return validInput(val!, 5, 30, "password");
                              },
                              myController: controller.Password,
                              lable: "15".tr, //"Password"
                              hint: "16".tr, //"Enter your Password"
                              icon: Icons.lock_outlined),
                        ),
                        InkWell(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: Text(
                            "17".tr, // "Forget Password"
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButtonAuth(
                          text: "18".tr, //"Sign In"
                          onPressed: () {
                            controller.logIn();
                          },
                        ),
                        customTextLogin_SignUp(
                            onTap: () {
                              controller.goToSignup();
                            },
                            Text1: "19".tr, // "Don't have an account? "
                            Text2: "20".tr) //"Sign Up"
                      ],
                    ),
                  ),
                ))),
      ),
    );
  }
}
