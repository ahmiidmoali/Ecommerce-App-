import 'package:project33/linkapi.dart';

import '../../../../core/class/crud.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  getData(String email) async {
    var response = await crud.postData(AppLink.checkemailF, {"email": email});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
