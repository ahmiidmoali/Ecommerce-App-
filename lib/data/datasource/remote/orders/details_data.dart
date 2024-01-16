import 'package:project33/linkapi.dart';

import '../../../../core/class/crud.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);
  getData(String usersid, String ordersid) async {
    var response = await crud
        .postData(AppLink.details, {"usersid": usersid, "ordersid": ordersid});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
