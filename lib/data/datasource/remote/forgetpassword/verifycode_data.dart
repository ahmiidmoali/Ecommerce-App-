import 'package:project33/linkapi.dart';

import '../../../../core/class/crud.dart';

class VerifyCodeFData {
  Crud crud;
  VerifyCodeFData(this.crud);
  getData(String email, String verifycode) async {
    var response = await crud.postData(
        AppLink.verifycodeF, {"email": email, "verifycode": verifycode});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
