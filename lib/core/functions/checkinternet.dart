import 'dart:io';

checkInternet() async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print("true");
      return true;
    }
  } on SocketException catch (_) {
    print("false");
    return false;
  }
}
