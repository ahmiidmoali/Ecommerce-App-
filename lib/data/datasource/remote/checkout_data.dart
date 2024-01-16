import 'package:project33/linkapi.dart';

import '../../../core/class/crud.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  Checkout(Map data) async {
    var response = await crud.postData(AppLink.checkout, data);
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
