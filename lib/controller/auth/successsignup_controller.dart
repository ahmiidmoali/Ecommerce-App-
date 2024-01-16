import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogIn();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToPageLogIn() {
    Get.offAllNamed(AppRoute.login);
  }
}
