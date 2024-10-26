import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../core/color.dart';
import '../../core/static_assets.dart';
import '../../pages/view_ticket/view_ticket.dart';

class ConfirmReservationAlert extends StatelessWidget {
  const ConfirmReservationAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: Svg(StaticAssets.verification),
            height: 20.h,
            color: ColorConstants.green,
          ),
          4.yh,
          Text(
            'Payment Successfull!',
            style: Get.textTheme.bodySmall!.copyWith(
                color: ColorConstants.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: Text(
        'Successfully made payment and hotel booking',
        textAlign: TextAlign.center,
        style: Get.textTheme.labelMedium!.copyWith(color: ColorConstants.black),
      ),
      actions: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(ColorConstants.black)),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ViewTicket(),
                  )),
              child: Text(
                'View Ticket',
                style: Get.textTheme.labelLarge!
                    .copyWith(color: ColorConstants.primary),
              ),
            ),
            1.yh,
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorConstants.darkGrey)),
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: Get.textTheme.labelLarge!
                    .copyWith(color: ColorConstants.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
