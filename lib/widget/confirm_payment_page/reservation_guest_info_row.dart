import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color.dart';

class ReservationGuestInfoRow extends StatelessWidget {
  const ReservationGuestInfoRow({
    super.key,
    required this.firstInfo,
    required this.secondInfo,
  });

  final String firstInfo;
  final String secondInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstInfo,
          style: Get.textTheme.labelLarge!.copyWith(
              color: ColorConstants.darkGrey, fontWeight: FontWeight.bold),
        ),
        Text(
          secondInfo,
          style: Get.textTheme.labelLarge!.copyWith(
              color: ColorConstants.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
