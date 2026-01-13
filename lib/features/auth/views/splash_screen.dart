import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/images.dart';
import 'package:flutter_application_1/features/auth/controllers/splash_screen_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity),
              Image.asset(MyAppImages.logo, height: 200),
            ],
          );
        }
      ),
    );
  }
}
