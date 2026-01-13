import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/themes/app_theme.dart';
import 'package:get/get.dart';

class LodingDialog extends StatelessWidget {
  const LodingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: MyAppColor.backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: CircularProgressIndicator(color: MyAppColor.primaryColor),
        ),
      ),
    );
  }
}

showLodign() {
  Get.dialog(LodingDialog());
}
