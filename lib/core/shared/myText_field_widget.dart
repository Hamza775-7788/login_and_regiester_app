import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/themes/app_theme.dart';

class MyTextFieldWidget extends StatefulWidget {
  const MyTextFieldWidget({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    this.errorText,
  });
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  final String? errorText;
  @override
  State<MyTextFieldWidget> createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      forceErrorText: widget.errorText,
      obscureText: widget.isPassword ? isShow : false,
      controller: widget.controller,

      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  isShow = !isShow;
                  setState(() {});
                },
                icon: Icon(!isShow ? Icons.visibility_off : Icons.visibility),
              )
            : null,

        prefixIcon: Icon(widget.icon),
        hintText: widget.hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: MyAppColor.secondaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: MyAppColor.primaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
