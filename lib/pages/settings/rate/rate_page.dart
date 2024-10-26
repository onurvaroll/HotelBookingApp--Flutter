import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/color.dart';

class RatePage extends StatelessWidget {
  const RatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Rate",
            style: Get.textTheme.bodySmall!.copyWith(
                color: ColorConstants.black,
                letterSpacing: 0,
                fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: ColorConstants.black)),
      body: Center(
        child: Text(
          'Rate',
          style:
          Get.textTheme.bodyMedium!.copyWith(color: ColorConstants.black),
        ),
      ),
    );
  }
}
