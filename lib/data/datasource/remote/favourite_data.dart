import 'package:project33/linkapi.dart';

import '../../../core/class/crud.dart';

class FavouriteData {
  Crud crud;
  FavouriteData(this.crud);

  addfavourite(String itemid, String userid) async {
    var response = await crud
        .postData(AppLink.addfavourite, {"itemid": itemid, "id": userid});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  removefavourite(String itemid, String userid) async {
    var response = await crud.postData(
        AppLink.removefavourite, {"itemid": itemid, "userid": userid});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
