import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/color.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Privacy",
            style: Get.textTheme.bodySmall!.copyWith(
                color: ColorConstants.black,
                letterSpacing: 0,
                fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: ColorConstants.black)),
      body: Center(
        child: Text(
          'Privacy',
          style:
          Get.textTheme.bodyMedium!.copyWith(color: ColorConstants.black),
        ),
      ),
    );
  }
}
