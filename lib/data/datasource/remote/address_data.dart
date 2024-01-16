import 'package:project33/linkapi.dart';
import '../../../core/class/crud.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  viewData(String userid) async {
    var response = await crud.postData(AppLink.addressview, {"id": userid});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  deleteData(String addressid) async {
    var response =
        await crud.postData(AppLink.addressdelete, {"id": addressid});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  addData(String usersid, String addressneme, String addresscity,
      String addressstreet, String addressdetails, String addressphone) async {
    var response = await crud.postData(
      AppLink.addressadd,
      {
        "id": usersid,
        "name": addressneme,
        "city": addresscity,
        "street": addressstreet,
        "details": addressdetails,
        "phone": addressphone,
      },
    );
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  editData(String addressid, String addressneme, String addresscity,
      String addressstreet, String addressdetails, String addressphone) async {
    var response = await crud.postData(
      AppLink.addressedit,
      {
        "id": addressid,
        "name": addressneme,
        "city": addresscity,
        "street": addressstreet,
        "details": addressdetails,
        "phone": addressphone,
      },
    );
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
