import 'package:project33/linkapi.dart';

import '../../../../core/class/crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  getData(String email, String password) async {
    var response = await crud
        .postData(AppLink.login, {"email": email, "password": password});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
