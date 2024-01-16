import 'package:project33/linkapi.dart';

import '../../../core/class/crud.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);
  getData(String usersid) async {
    var response = await crud.postData(AppLink.offers, {"userid": usersid});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
