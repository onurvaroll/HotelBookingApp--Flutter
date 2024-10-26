import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/booked_controller/booked_controller.dart';
import 'package:hotel/controller/text_controller/text_controller.dart';
import 'package:hotel/core/static_assets.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/pages/main_pages/main_pages.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../core/color.dart';
import '../../widget/button_bottom_sheet/button_bottom_sheet.dart';

class ViewTicket extends StatelessWidget {
  const ViewTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      appBar: AppBar(
        title: Text(
          'Ticket',
          style: Get.textTheme.bodySmall!.copyWith(
              color: ColorConstants.black,
              letterSpacing: 0,
              fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: ColorConstants.black),
      ),
      bottomSheet: ButtonBottomSheet(
        buttonName: 'Download Ticket',
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MainPages()),
            (Route<dynamic> route) => false,
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 20.pAll,
          child: Column(
            children: [
              TicketWidget(
                width: Get.size.width,
                height: Get.size.height,
                isCornerRounded: true,
                padding: 20.pAll,
                color: ColorConstants.primary,
                child: TicketData(),
              ),
              12.yh
            ],
          ),
        ),
      ),
    );
  }
}

class TicketData extends StatelessWidget {
  TicketData({
    super.key,
  });

  final bookedController = Get.put(BookedController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${bookedController.bookedHotelName}',
          textAlign: TextAlign.center,
          style: Get.textTheme.bodySmall!.copyWith(color: ColorConstants.black),
        ),
        Image(
          height: Get.size.height * 0.42,
          width: Get.size.height * 0.42,
          fit: BoxFit.fill,
          image: Svg(
            color: ColorConstants.black,
            StaticAssets.qrcode,
          ),
        ),
        Divider(
          color: ColorConstants.primary,
          thickness: 2,
        ),
        8.yh,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleInfoColumn(
                    title: 'Name',
                    content: TextControllers().reservedName.text),
                SingleInfoColumn(
                    title: 'Check In Date',
                    content: bookedController.bookedCheckInDate),
                SingleInfoColumn(
                    title: 'Check In Time',
                    content: bookedController.bookedCheckInTime),
                SingleInfoColumn(
                    title: 'Hotel',
                    content:
                        '${bookedController.bookedHotelName?.replaceAll("Hotel", "").trim()}'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleInfoColumn(
                  title: 'Phone Number',
                  content: '${bookedController.toConnectPhoneNumber()}',
                ),
                SingleInfoColumn(
                    title: 'Check Out Date',
                    content: bookedController.bookedCheckOutDate),
                SingleInfoColumn(
                    title: 'Check Out Time',
                    content: bookedController.bookedCheckOutTime),
                SingleInfoColumn(
                  title: 'Adult/Children',
                  content:
                      '${bookedController.bookedAdultSize}/${bookedController.bookedChildSize}',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class SingleInfoColumn extends StatelessWidget {
  const SingleInfoColumn({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Get.textTheme.labelMedium!.copyWith(
              color: ColorConstants.darkGrey, fontWeight: FontWeight.bold),
        ),
        Text(
          content,
          textAlign: TextAlign.center,
          style: Get.textTheme.labelLarge!.copyWith(
              color: ColorConstants.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
