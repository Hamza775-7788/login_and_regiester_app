import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/images.dart';
import 'package:flutter_application_1/core/shared/buttons.dart';
import 'package:flutter_application_1/core/shared/myText_field_widget.dart';
import 'package:flutter_application_1/core/themes/app_theme.dart';
import 'package:flutter_application_1/features/auth/controllers/sign_in_controller.dart';
import 'package:flutter_application_1/features/auth/views/register_view.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignInController>(
        init: SignInController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(MyAppImages.logo, height: 150),
                const SizedBox(height: 16),
                MyTextFieldWidget(
                  errorText: controller.emailError,
                  icon: Icons.email_outlined,
                  hint: "Email",
                  controller: emailController,
                ),
                const SizedBox(height: 16),
                MyTextFieldWidget(
                  errorText: controller.passwordError,
                  icon: Icons.key_outlined,
                  hint: "Password",
                  controller: passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: MyGenralButton(
                        name: "LOGIN",
                        onTap: () {
                          controller.signIn(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        },
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have Account yet? "),
                    TextButton(
                      onPressed: () {
                        Get.to(() => RegisterView());
                      },
                      child: Text(
                        "Create one",
                        style: TextStyle(color: MyAppColor.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
