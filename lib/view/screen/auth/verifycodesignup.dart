import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/view/widget/auth/customtextbodyauth.dart';
import 'package:project33/view/widget/auth/customtexttitleauth.dart';
import '../../../controller/auth/verifycodesignup_controller.dart';

class checkMail extends StatelessWidget {
  const checkMail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(verifyCodeSignupControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.background,
        elevation: 0.0,
      ),
      body: GetBuilder<verifyCodeSignupControllerImp>(
          builder: (controller) => handlingRequestView(
              statusRequest: controller.statusRequest!,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    customTextTitleAuth(text: "35".tr), //"Verifacation Code"
                    const SizedBox(
                      height: 15,
                    ),
                    customTextBodyAuth(
                        title: "36"
                            .tr), //"Enter the 5 digits code that we have sent\nthrough your e-mail"
                    const SizedBox(
                      height: 15,
                    ),
                    OtpTextField(
                      fieldWidth: 50,
                      borderRadius: BorderRadius.circular(20),
                      numberOfFields: 5,
                      borderColor: const Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash Color(0xFF512DA8)
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        controller.checkCode(verificationCode);
                      }, // end onSubmit
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: () {
                        controller.resend(controller.email);
                      },
                      child: const Text(
                        "Resend Verify Code",
                        style: TextStyle(
                            fontSize: 25, color: AppColor.primaryColor),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
