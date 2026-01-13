import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/themes/app_theme.dart';

class MyGenralButton extends StatelessWidget {
  const MyGenralButton({super.key, required this.name, required this.onTap});
  final String name;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: MyAppColor.primaryColor,
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}