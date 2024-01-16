import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/view/widget/auth/customtextbodyauth.dart';
import 'package:project33/view/widget/auth/customtexttitleauth.dart';
import '../../../../controller/auth/forgetpassword/successresetpassword_controller.dart';
import '../../../widget/auth/custombuttonauth.dart';

class successResetPassword extends StatelessWidget {
  const successResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
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
            customTextTitleAuth(text: "55".tr), //"Password Changed"
            const SizedBox(
              height: 15,
            ),
            customTextBodyAuth(
                title: "56"
                    .tr), //"Your password successfully changed.\nDo not disclose your password\nto anyone to avoid a cyber attack"
            const SizedBox(
              height: 60,
            ),
            CustomButtonAuth(
              text: "57".tr, //"Back To The App"
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
