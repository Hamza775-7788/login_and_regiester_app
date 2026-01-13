import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/images.dart';
import 'package:flutter_application_1/core/shared/buttons.dart';
import 'package:flutter_application_1/core/shared/myText_field_widget.dart';
import 'package:flutter_application_1/core/themes/app_theme.dart';
import 'package:flutter_application_1/features/auth/controllers/register_controller.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passswordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: MyAppColor.backgroundColor),
      body: GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Image.asset(MyAppImages.logo, height: 150),
                  Text(
                    "Fill in the Fields to Create a new account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  MyTextFieldWidget(
                    hint: "Name",
                    icon: Icons.person,
                    controller: nameController,
                  ),
                  const SizedBox(height: 16),
                  MyTextFieldWidget(
                    errorText: controller.emailError,
                    hint: "Email",
                    icon: Icons.email_outlined,
                    controller: emailController,
                  ),
                  const SizedBox(height: 16),
                  MyTextFieldWidget(
                    errorText: controller.passwordError,
                    hint: "Password",
                    icon: Icons.key_outlined,
                    controller: passswordController,
                  ),
                  const SizedBox(height: 16),
                  MyGenralButton(
                    name: "Register",
                    onTap: () {
                      controller.createAccount(
                        email: emailController.text,
                        password: passswordController.text,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have Account? "),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: MyAppColor.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
