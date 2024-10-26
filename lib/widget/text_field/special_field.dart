import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/color.dart';

class SpecialField extends StatelessWidget {
   const SpecialField({
    super.key, required this.hintText,required this.prefix,required this.suffix, required this.obscureText,required this.keyboardType, required this.controller
  });
  final String hintText;
  final Widget prefix;
  final Widget suffix;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText:obscureText,
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: ColorConstants.black,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: ColorConstants.darkGrey),
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
        filled: true,
        fillColor: ColorConstants.lightGrey,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: ColorConstants.black, width: 2.0),
        ),
        hintText: hintText,
        hintStyle: Get.textTheme.labelLarge!.copyWith(color: ColorConstants.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: ColorConstants.black),
        ),
      ),
      style: Get.textTheme.bodySmall!.copyWith(color: ColorConstants.black),
    );
  }
}