import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/core/middleware/mymiddleware.dart';
import 'package:project33/view/screen/address/address_add.dart';
import 'package:project33/view/screen/address/address_view.dart';
import 'package:project33/view/screen/auth/verifycodesignup.dart';
import 'package:project33/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:project33/view/screen/auth/login.dart';
import 'package:project33/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:project33/view/screen/auth/signup.dart';
import 'package:project33/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:project33/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:project33/view/screen/auth/sucesssignup.dart';
import 'package:project33/view/screen/cartpage.dart';
import 'package:project33/view/screen/checkout.dart';
import 'package:project33/view/screen/homescreen.dart';
import 'package:project33/view/screen/itemsdetails.dart';
import 'package:project33/view/screen/itemspage.dart';
import 'package:project33/view/screen/language.dart';
import 'package:project33/view/screen/myfavouritepage.dart';
import 'package:project33/view/screen/onboarding.dart';
import 'package:project33/view/screen/orders/archive.dart';
import 'package:project33/view/screen/orders/ordersdetails.dart';
import 'package:project33/view/screen/orders/pending.dart';
import 'package:project33/view/screen/profile.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => const testView()),
  //auth
  GetPage(
    name: AppRoute.login,
    page: () => const login(),
  ),
  GetPage(name: AppRoute.signUp, page: () => const signUp()),
  GetPage(name: AppRoute.verifysignup, page: () => const checkMail()),
  GetPage(name: AppRoute.successsignup, page: () => const successSignUp()),
  //forget password
  GetPage(name: AppRoute.forgetPassword, page: () => const forgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const verifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const resetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const successResetPassword()),
  //onboarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //homepage
  GetPage(name: AppRoute.homepage, page: () => const homeScreen()),
  GetPage(name: AppRoute.profile, page: () => const profilePage()),
  //itemspage
  GetPage(name: AppRoute.itemspage, page: () => const itemsPage()),
  GetPage(name: AppRoute.itemsdetails, page: () => const itemsDetails()),
  GetPage(name: AppRoute.myfavourite, page: () => const myFavouritePage()),
  GetPage(name: AppRoute.cartpage, page: () => const cartPage()),
  //address
  GetPage(name: AppRoute.addressview, page: () => const addressview()),
  GetPage(name: AppRoute.addressadd, page: () => const addressadd()),
  //orders checkout
  GetPage(name: AppRoute.checkout, page: () => const checkOut()),
  GetPage(name: AppRoute.pending, page: () => const pendingorders()),
  GetPage(name: AppRoute.orderdetails, page: () => const orderDetails()),
  GetPage(name: AppRoute.orderarchive, page: () => const archiveorders()),
];




// Map<String, Widget Function(BuildContext)> routes = {
//   //auth
//   AppRoute.login: (p0) => const login(),
//   AppRoute.signUp: (p0) => const signUp(),
//   AppRoute.checkemail: (p0) => const checkMail(),
//   AppRoute.successsignup: (p0) => const successSignUp(),
//   //forget password
//   AppRoute.forgetPassword: (p0) => const forgetPassword(),
//   AppRoute.verifyCode: (p0) => const verifyCode(),
//   AppRoute.resetPassword: (p0) => const resetPassword(),
//   AppRoute.successResetPassword: (p0) => const successResetPassword(),
//   //onboarding
//   AppRoute.onBoarding: (p0) => const OnBoarding()
// };
