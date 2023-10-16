import 'package:flutter/material.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/utilities/colors_style.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/utilities/text_style.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController? controller;
  final Function(String)? validator;
  final Function()? onTapSuffixIcon;
  final bool isObscured;
  final IconData? suffixIcon;

  CustomTextField({
    required this.label,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.onTapSuffixIcon,
    this.isObscured = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                label,
                style: blackTextStyle,
              ),
              const Text(
                "*",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: isPassword ? isObscured : false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            labelStyle: greyTextStyle.copyWith(fontSize: 12),
            labelText: label,
            suffixIcon: onTapSuffixIcon != null
                ? GestureDetector(
                    onTap: onTapSuffixIcon,
                    child: Icon(suffixIcon, color: greyColor),
                  )
                : null,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: greyColor),
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ],
    );
  }
}
