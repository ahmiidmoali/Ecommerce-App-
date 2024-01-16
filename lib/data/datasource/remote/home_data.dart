import 'package:project33/linkapi.dart';

import '../../../core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.home, {"id": id});
    // print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  searchData(String search) async {
    var response = await crud.postData(AppLink.search, {"search": search});
    // print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
