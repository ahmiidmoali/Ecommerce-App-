import 'package:project33/linkapi.dart';

import '../../../../core/class/crud.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  getData(String email, String password) async {
    var response = await crud.postData(
        AppLink.resetpasswordF, {"email": email, "password": password});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
