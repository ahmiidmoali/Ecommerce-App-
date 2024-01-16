import 'package:get/get.dart';
import 'package:project33/core/services/services.dart';

translateDataBase(columnen, columnar) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
