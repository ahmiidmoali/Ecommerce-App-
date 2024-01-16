import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/auth/signup_controller.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/class/statusrequest.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/core/functions/alertexitapp.dart';
import 'package:project33/core/functions/validinput.dart';
import 'package:project33/view/widget/auth/customtextbodyauth.dart';
import 'package:project33/view/widget/auth/customtextformfieldauth.dart';
import 'package:project33/view/widget/auth/customtextlogin&signup.dart';
import 'package:project33/view/widget/auth/customtexttitleauth.dart';
import '../../widget/auth/custombuttonauth.dart';

class signUp extends StatelessWidget {
  const signUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "21".tr, //"Sign up"
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
        child: GetBuilder<SignUpControllerImp>(
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
                        customTextTitleAuth(text: "22".tr), //"Complete Profile"
                        const SizedBox(
                          height: 15,
                        ),
                        customTextBodyAuth(
                            title: "23".tr), //"complete your details"
                        const SizedBox(
                          height: 15,
                        ),
                        customTextFormAuth(
                            isNumber: false,
                            vaild: (val) {
                              return validInput(val!, 5, 12, "username");
                            },
                            myController: controller.Username,
                            lable: "24".tr, //"Username"
                            hint: "25".tr, //"Enter your Username"
                            icon: Icons.person_2_outlined),
                        customTextFormAuth(
                            isNumber: false,
                            vaild: (val) {
                              return validInput(val!, 5, 100, "email");
                            },
                            myController: controller.Email,
                            lable: "26".tr, //"Email"
                            hint: "27".tr, //"Enter your email"
                            icon: Icons.email_outlined),
                        customTextFormAuth(
                            isNumber: true,
                            vaild: (val) {
                              return validInput(val!, 7, 20, "mobile");
                            },
                            myController: controller.Mobile,
                            lable: "28".tr, //"Mobile"
                            hint: "29".tr, //"Enter your number"
                            icon: Icons.phone_android_outlined),
                        customTextFormAuth(
                            isNumber: false,
                            vaild: (val) {
                              return validInput(val!, 5, 13, "password");
                            },
                            myController: controller.Password,
                            lable: "30".tr, //"Password"
                            hint: "31".tr, //"Enter your Password"
                            icon: Icons.lock_outlined),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButtonAuth(
                          text: "32".tr, //"Sign Up"
                          onPressed: () {
                            controller.SignUP();
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        customTextLogin_SignUp(
                            onTap: () {
                              controller.goToSignIn();
                            },
                            Text1: "33".tr, //" have an account? "
                            Text2: "34".tr) //"Sign In"
                      ],
                    ),
                  ),
                ))),
      ),
    );
  }
}
