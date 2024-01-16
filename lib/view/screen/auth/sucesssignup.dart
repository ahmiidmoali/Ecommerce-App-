import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/auth/forgetpassword/forgetPassword_controller.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/view/widget/auth/customtextbodyauth.dart';
import 'package:project33/view/widget/auth/customtexttitleauth.dart';

import '../../../controller/auth/successsignup_controller.dart';
import '../../widget/auth/custombuttonauth.dart';

class successSignUp extends StatelessWidget {
  const successSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.background,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: ListView(
          children: [
            const SizedBox(
              height: 150,
            ),
            const Icon(
              Icons.check_circle_outline_outlined,
              size: 120,
              color: AppColor.primaryColor,
            ),
            customTextTitleAuth(
                text: "37"
                    .tr), //"Congratulations!\nyou have successfully Sign Up"
            const SizedBox(
              height: 15,
            ),
            customTextBodyAuth(
                title: "38"
                    .tr), //"Do not disclose your password\nto anyone to avoid a cyber attack"
            const SizedBox(
              height: 60,
            ),
            CustomButtonAuth(
              text: "39".tr, //"Continue"
              onPressed: () {
                controller.goToPageLogIn();
              },
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
