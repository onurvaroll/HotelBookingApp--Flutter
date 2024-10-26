import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../../core/static_assets.dart';

class ForgotDetails extends StatelessWidget {
  const ForgotDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.pAll,
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
            width: 50.w,
            child: Image(
              image: Svg(StaticAssets.forgotPassword),
              fit: BoxFit.cover,
            ),
          ),
          4.yh,
          Text(
            "Select which contact details should we use to reset your password.",
            style: Get.textTheme.labelMedium!.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
