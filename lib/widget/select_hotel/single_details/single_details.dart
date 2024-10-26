import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../../core/color.dart';

class SingleDetails extends StatelessWidget {
  const SingleDetails({
    super.key,
    required this.icons,
    required this.text,
  });

  final IconData icons;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icons,
            color: ColorConstants.green,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style:
            Get.textTheme.labelSmall!.copyWith(color: ColorConstants.black),
          )
        ],
      ),
    );
  }
}
