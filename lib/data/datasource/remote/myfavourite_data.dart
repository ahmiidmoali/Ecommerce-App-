import 'package:project33/linkapi.dart';

import '../../../core/class/crud.dart';

class MyFavouriteData {
  Crud crud;
  MyFavouriteData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.viewfavourite, {"id": userid});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
