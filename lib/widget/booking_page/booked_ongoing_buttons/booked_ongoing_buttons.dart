import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../../core/color.dart';

class BookedOngoingButtons extends StatelessWidget {
  const BookedOngoingButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(color: ColorConstants.black)),
              ),
              child: Text(
                'Cancel Booking',
                style: Get.textTheme.labelMedium!.copyWith(
                    color: ColorConstants.black, fontWeight: FontWeight.bold),
              ),
            )),
        4.xw,
        Expanded(
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(ColorConstants.black),
              ),
              child: Text('View Ticket',
                  style: Get.textTheme.labelMedium!.copyWith(
                      color: ColorConstants.primary, fontWeight: FontWeight.bold)),
            ))
      ],
    );
  }
}
