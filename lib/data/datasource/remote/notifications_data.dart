import 'package:project33/linkapi.dart';

import '../../../core/class/crud.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.notifications, {"usersid": usersid});
    print("================$response===================");
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
