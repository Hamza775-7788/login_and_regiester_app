import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/shared/buttons.dart';
import 'package:flutter_application_1/features/auth/controllers/sign_in_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder<SignInController>(
          init: SignInController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyGenralButton(
                  name: "Logout",
                  onTap: () async {
                    controller.signOut();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
