import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../../core/color.dart';

class BookedAlertContainer extends StatelessWidget {
  const BookedAlertContainer({
    super.key, required this.statusCode,
  });
  final String statusCode;

  @override
  Widget build(BuildContext context) {
    Color cardColor;
    Color textColor;
    String text;
    IconData icons;
    if (statusCode == 'completed') {
      cardColor = ColorConstants.greenLight;
      textColor = ColorConstants.green;
      text = 'Yeay, you have completed it';
      icons=Icons.check;
    } else {
      cardColor = ColorConstants.lightRed;
      textColor = ColorConstants.red;
      text = 'You canceled this hotel booking';
      icons=Icons.cancel;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: cardColor,
      ),
      child: Padding(
        padding: 4.pAll,
        child: Row(
          children: [
            Icon(
              icons,
              color: textColor,
            ),
            2.xw,
            Text(text,
                style: Get.textTheme.labelSmall!.copyWith(
                  color: textColor,
                ))
          ],
        ),
      ),
    );
  }
}
