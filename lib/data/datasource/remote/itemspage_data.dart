import 'package:project33/linkapi.dart';

import '../../../core/class/crud.dart';

class ItemsPageData {
  Crud crud;
  ItemsPageData(this.crud);
  getData(String idCat, String userid) async {
    var response =
        await crud.postData(AppLink.itemspage, {"catid": idCat, "id": userid});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
