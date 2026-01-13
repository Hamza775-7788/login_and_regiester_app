import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/shared/loding_dialog.dart';
import 'package:flutter_application_1/features/auth/services/auth_api_secvicess.dart';
import 'package:flutter_application_1/features/auth/views/splash_screen.dart';
import 'package:flutter_application_1/features/home/views/home_view.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  AuthApiSecvicess _secvicess = AuthApiSecvicess();

  String? emailError;
  String? passwordError;

  Future<void> signIn({required String email, required String password}) async {
    if (email.isEmpty) {
      emailError = "This field is Required";
      update();
      return;
    } else if (password.isEmpty) {
      passwordError = "This field is Required";
      update();
      return;
    }

    try {
      showLodign();
      final response = await _secvicess.signIn(
        email: email,
        password: password,
      );

      if (response) {
        Get.back();
        Get.to(() => HomeView());
      }
    } on UserNotFoundException {
      emailError = "user-not-found";
      update();
      Get.back();
    } on WrongPasswordException {
      passwordError = "wrong-password";
      update();
      Get.back();
    } catch (e) {
      emailError = "$e";
      update();
      Get.back();
    }
  }

  Future<void> signOut() async {
    final response = await _secvicess.signOut();

    if (response) {
      Get.offAll(() => SplashScreen());
    }
  }
}
