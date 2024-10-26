import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/color.dart';
import '../../../../widget/authentication_page/forgot_password/forgot_details.dart';
import '../../../../widget/authentication_page/forgot_password/forgot_option.dart';
import '../../../../widget/authentication_page/forgot_password/sms_mail_sender.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isSelect = false;
  bool option = false; // SMS: true, Email: false

  void _selectOption(bool option) {
    setState(() {
      isSelect = true;
      this.option = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.black),
        title: Text(
          "Forgot Password",
          style: Get.textTheme.bodyMedium!.copyWith(color: ColorConstants.black),
        ),
      ),
      body: ListView(
        children: [
          const ForgotDetails(),
          isSelect ? SendToMailAndSms(option: option) : ForgotOption(onSelectOption: _selectOption),
        ],
      ),
    );
  }
}



