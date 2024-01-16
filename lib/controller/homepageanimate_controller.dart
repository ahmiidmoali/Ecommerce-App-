import 'package:get/get.dart';
import 'package:project33/core/constant/imageasset.dart';

class HomePageAnimateController extends GetxController {
//default image
  List<String> imagename = [AppImageAsset.logo];
//imagesfrom database
  List<String> imagename2 = [
    AppImageAsset.adsiphon,
    AppImageAsset.lenovoads,
    AppImageAsset.onBoardingImageOne
  ];

  String myimage = AppImageAsset.sale;
  int myindex = 0;
  bool newturn = false;

  Future fun() async {
    for (int i = 0; i < imagename.length; i++) {
      if (newturn == true) {
        await Future.delayed(const Duration(seconds: 10), () {
          myimage = imagename[0];
          myindex = 0;
          update();
        });
      }

      await Future.delayed(const Duration(seconds: 10), () {
        if (i < imagename.length) {
          myimage = imagename[i];
          myindex = i;
          update();
          newturn = false;
        }
        if (i == imagename.length - 1) {
          i = 0;
          newturn = true;
        }
      });
    }
  }

  @override
  void onInit() {
    imagename.addAll(imagename2);
    fun();

    super.onInit();
  }
}
