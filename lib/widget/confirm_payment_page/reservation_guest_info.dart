import 'package:flutter/material.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../core/color.dart';

class ReservationGuestInfo extends StatelessWidget {
  const ReservationGuestInfo({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: Get.size.height * 0.3,
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
        child: widget,
      ),
    );
  }
}
