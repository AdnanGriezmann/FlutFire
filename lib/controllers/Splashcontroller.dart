import 'package:flutfire/views/SignInScreen/SignInScreen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 4), () {
      Get.offAll(SignInScreen(), transition: Transition.rightToLeftWithFade);
    });
  }
}
