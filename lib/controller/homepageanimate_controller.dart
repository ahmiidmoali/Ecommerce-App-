import 'package:get/get.dart';
import 'package:project33/controller/homepage_controller.dart';
import 'package:project33/core/constant/imageasset.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/data/model/itemsmodel.dart';
import 'package:project33/view/screen/offers.dart';

class HomePageAnimateController extends HomePageControllerImp {
//imagesfrom database
  String myimage = "logo.png";
  int myindex = 0;
  int type = 0;
  String content = "";
  int? citemsid;
  bool newturn = false;

  takeaction() {
    if (type == 0) {
      Get.toNamed(AppRoute.myfavourite);
    }
    if (type == 1) {
      List theitems = [];
      theitems.addAll(
          items.where((element) => element["items_id"] == citemsid).toList());
      print(theitems);
      Map<String, dynamic> mapitems = theitems[0];

      Itemsmodel theitemmodel = Itemsmodel.fromJson(mapitems);
      Get.toNamed(AppRoute.itemsdetails,
          arguments: {"itemsmodel": theitemmodel});
    }
  }

  Future fun() async {
    for (int i = 0; i < myadsdata.length; i++) {
      if (newturn == true) {
        await Future.delayed(const Duration(seconds: 10), () {
          myimage = myadsdata[0]["ads_image"];
          type = myadsdata[0]["ads_type"];
          content = myadsdata[0]["ads_content"];
          myindex = 0;
          update();
        });
      }

      await Future.delayed(const Duration(seconds: 10), () {
        if (i < myadsdata.length) {
          myimage = myadsdata[i]["ads_image"];
          type = myadsdata[i]["ads_type"];
          content = myadsdata[i]["ads_content"];
          citemsid = myadsdata[i]["ads_itemsid"];
          myindex = i;
          update();
          newturn = false;
        }
        if (i == myadsdata.length - 1) {
          i = 0;
          newturn = true;
        }
      });
    }
  }

  @override
  void onInit() {
    // imagename.addAll(imagename2);

    fun();

    super.onInit();
  }
}
