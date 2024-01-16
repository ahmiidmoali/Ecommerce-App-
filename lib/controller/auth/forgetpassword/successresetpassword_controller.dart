import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToPageLogIn();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToPageLogIn() {
    Get.offAllNamed(AppRoute.login);
  }
}
