import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../../controller/hotel_controller/hotel_controller.dart';
import '../../../core/color.dart';
import '../../../model/booked_model.dart';
import '../booked_alert_container/booked_alert_container.dart';
import '../booked_ongoing_buttons/booked_ongoing_buttons.dart';
import '../booked_status_card/booked_status_card.dart';

class BookedHotelCard extends StatelessWidget {
  BookedHotelCard({
    super.key,
    required this.bookedModel,
  });

  final BookedModel bookedModel;
  final hotelController = Get.find<HotelController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 4.pV,
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
            padding: 8.pAll,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 12.h,
                      width: 12.h,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            hotelController
                                .getHotelsInfo(bookedModel.bookedHotelId)
                                .coverPhoto,
                            fit: BoxFit.cover,
                          )),
                    ),
                    4.xw,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            hotelController
                                .getHotelsInfo(bookedModel.bookedHotelId)
                                .hotelName,
                            style: Get.textTheme.labelMedium!.copyWith(
                                color: ColorConstants.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0)),
                        Text(
                            hotelController
                                .getHotelsInfo(bookedModel.bookedHotelId)
                                .location,
                            style: Get.textTheme.labelSmall!
                                .copyWith(color: ColorConstants.darkGrey)),
                        BookedStatusCard(
                          statusCode: bookedModel.bookedStatus,
                        )
                      ],
                    )
                  ],
                ),
                4.yh,
                Divider(
                  color: ColorConstants.darkGrey,
                  height: 2,
                ),
                2.yh,
                bookedModel.bookedStatus == 'ongoing'
                    ? const BookedOngoingButtons()
                    : BookedAlertContainer(
                        statusCode: bookedModel.bookedStatus,
                      ),
              ],
            ),
          )),
    );
  }
}
