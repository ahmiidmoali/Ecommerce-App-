
import 'package:project33/linkapi.dart';

import '../../../../core/class/crud.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  getData(String username, String email, String password, String phone) async {
    var response = await crud.postData(AppLink.signup, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    });
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
