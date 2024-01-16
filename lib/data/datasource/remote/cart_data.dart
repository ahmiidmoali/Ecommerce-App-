import 'package:project33/linkapi.dart';

import '../../../core/class/crud.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart(String itemid, String userid) async {
    var response = await crud
        .postData(AppLink.addcart, {"itemsid": itemid, "usersid": userid});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  removeCart(String itemid, String userid) async {
    var response = await crud
        .postData(AppLink.removecart, {"itemsid": itemid, "usersid": userid});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  getcountitems(String itemid, String userid) async {
    var response = await crud.postData(
        AppLink.getcountitems, {"itemsid": itemid, "usersid": userid});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  viewcart(String userid) async {
    var response = await crud.postData(AppLink.viewcart, {"usersid": userid});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  checkcoupon(String couponname) async {
    var response =
        await crud.postData(AppLink.checkcoupon, {"name": couponname});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
