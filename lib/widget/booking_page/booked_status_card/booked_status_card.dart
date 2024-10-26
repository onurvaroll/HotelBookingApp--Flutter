import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/color.dart';

class BookedStatusCard extends StatelessWidget {
  const BookedStatusCard({
    super.key,
    required this.statusCode,
  });

  final String statusCode;

  @override
  Widget build(BuildContext context) {
    Color cardColor;
    Color textColor;
    String text;
    if (statusCode == 'ongoing') {
      cardColor = ColorConstants.greenLight;
      textColor = ColorConstants.green;
      text = 'Paid';
    } else if (statusCode == 'completed') {
      cardColor = ColorConstants.greenLight;
      textColor = ColorConstants.green;
      text = 'Completed';
    } else {
      cardColor = ColorConstants.lightRed;
      textColor = ColorConstants.red;
      text = 'Canceled';
    }
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: Get.textTheme.labelSmall!
              .copyWith(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
