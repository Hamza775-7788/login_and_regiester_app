import 'package:flutter_application_1/features/auth/services/auth_api_secvicess.dart';
import 'package:flutter_application_1/features/auth/views/login_view.dart';
import 'package:flutter_application_1/features/home/views/home_view.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  AuthApiSecvicess _secvicess = AuthApiSecvicess();

  Future<void> getUserInfo() async {
    final response = await _secvicess.getUserInfo();
    await Future.delayed(Duration(seconds: 2));
    if (response) {
      Get.to(() => HomeView());
    } else {
      Get.to(() => LoginView());
    }
  }

  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }
}
