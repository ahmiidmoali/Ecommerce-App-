import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/bindings/initialbindings.dart';
import 'package:project33/core/localization/changelocal.dart';
import 'package:project33/core/localization/translation.dart';
import 'package:project33/core/services/services.dart';
import 'package:project33/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      translations: MyTranslation(),
      // routes: routes,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
