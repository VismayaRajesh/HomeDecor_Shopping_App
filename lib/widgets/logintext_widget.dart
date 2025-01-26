import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginTextWidget extends StatelessWidget {
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final VoidCallback? onSuffixIconTap;

  const LoginTextWidget({
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.onSuffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
            color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 14),
        prefixIcon: prefixIcon != null
            ? Icon(
          prefixIcon,
          color: const Color.fromRGBO(153, 133, 88, 1),
        )
            : null,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
          onTap: onSuffixIconTap,
          child: Icon(
            suffixIcon,
            color: const Color.fromRGBO(153, 133, 88, 1),
          ),
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Color.fromRGBO(153, 133, 88, 1),
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
              color: Color.fromRGBO(153, 133, 88, 1), width: 2),
        ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      ),
      validator: validator,
    );
  }
}