import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../core/color.dart';

class NotificationsCard extends StatelessWidget {
  const NotificationsCard({
    super.key,
    required this.icon,
    required this.iconColor,
  });

  final String icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 8.pV,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          color: ColorConstants.primary,
        ),
        child: Padding(
          padding: 16.pAll,
          child: Row(
            children: [
              Image(
                image: Svg(
                  icon,
                ),
                height: 50,
                color: iconColor,
              ),
              2.xw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Payment Successfull',
                    style: Get.textTheme.labelLarge!
                        .copyWith(color: ColorConstants.black),
                  ),
                  Text(
                    'E-Wallet has been connected to BookHotel',
                    style: Get.textTheme.labelSmall!
                        .copyWith(color: ColorConstants.darkGrey,letterSpacing: 0),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
