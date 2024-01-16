import 'package:project33/linkapi.dart';

import '../../../../core/class/crud.dart';

class VerifyCodeSignupData {
  Crud crud;
  VerifyCodeSignupData(this.crud);
  getData(String email, String verificationCode) async {
    var response = await crud.postData(
        AppLink.verifycode, {"email": email, "verifycode": verificationCode});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  resend(String email) async {
    var response = await crud.postData(AppLink.resend, {"email": email});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
