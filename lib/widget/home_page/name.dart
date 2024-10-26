import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../const/const.dart';
import '../../core/color.dart';

class HomePageName extends StatelessWidget {
  const HomePageName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Const().geciciAd,
      style: Get.textTheme.bodyMedium!
          .copyWith(color: ColorConstants.green, fontFamily: "Ultra"),
    );
  }
}
