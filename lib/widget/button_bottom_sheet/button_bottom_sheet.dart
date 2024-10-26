import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../core/color.dart';

class ButtonBottomSheet extends StatelessWidget {
  const ButtonBottomSheet({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  final Function onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstants.primary,
          border:
          Border(top: BorderSide(color: ColorConstants.black, width: 0.1)),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30))),
      height: 12.h,
      child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(ColorConstants.black),
                ),
                onPressed: () => onPressed(),
                // Burada doğru bir şekilde fonksiyonu geçiyoruz
                child: Text(
                  buttonName,
                  style: Get.textTheme.labelLarge!.copyWith(
                      color: ColorConstants.primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )),
    );
  }
}
