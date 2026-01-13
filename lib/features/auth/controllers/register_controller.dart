import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/shared/loding_dialog.dart';
import 'package:flutter_application_1/features/auth/services/auth_api_secvicess.dart';
import 'package:flutter_application_1/features/home/views/home_view.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  AuthApiSecvicess _secvicess = AuthApiSecvicess();

  String? emailError;
  String? passwordError;
  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isEmpty) {
        emailError = "This field is Required";
        update();
        return;
      } else if (password.isEmpty) {
        passwordError = "This field is Required";
        update();
        return;
      }
      showLodign();
      final response = await _secvicess.createAccount(
        email: email,
        password: password,
      );

      if (response) {
        Get.to(() => HomeView());
      }
    } on EmailAlreadyUsedException {
      emailError = "The account already exists for that email.";
      update();
    } on WeakPasswordException {
      passwordError = "The password provided is too weak.";
      update();
    } catch (e) {
      emailError = "$e";
      update();
    }
    Get.back();
  }
}
