import 'package:project33/linkapi.dart';

import '../../../../core/class/crud.dart';

class PendingData {
  Crud crud;
  PendingData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.pending, {"usersid": id});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  deleteOrder(String id) async {
    var response = await crud.postData(AppLink.delete, {"ordersid": id});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  rateOrder(String id, String rate, String comment) async {
    var response = await crud.postData(AppLink.rating,
        {"ordersid": id, "ordersrate": rate, "orderscomment": comment});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
