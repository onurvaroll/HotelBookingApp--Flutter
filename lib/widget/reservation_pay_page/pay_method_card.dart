import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../core/color.dart';

class PayMethodCard extends StatelessWidget {
  const PayMethodCard({
    super.key,
    required this.svgImage,
    required this.payName,
    required this.widget,
  });

  final String svgImage;
  final String payName;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorConstants.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: 16.pAll,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(
                  image: Svg(svgImage),
                  height: 50,
                ),
                4.xw,
                Text(
                  payName,
                  style: Get.textTheme.labelLarge!.copyWith(
                      color: ColorConstants.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0),
                ),
              ],
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
