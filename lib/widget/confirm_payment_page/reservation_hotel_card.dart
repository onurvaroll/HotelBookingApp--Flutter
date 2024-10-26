import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../controller/booked_controller/booked_controller.dart';
import '../../core/color.dart';

class ReservationHotelCard extends StatelessWidget {
  ReservationHotelCard({
    super.key,
  });
  final controller = Get.put(BookedController());

  @override
  Widget build(BuildContext context) {
    return Container(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 16.h,
                    width: 16.h,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/room1.jpg',
                          fit: BoxFit.cover,
                        )),
                  ),
                  4.xw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${controller.bookedHotelName}',
                          style: Get.textTheme.labelLarge!.copyWith(
                              color: ColorConstants.black,
                              fontWeight: FontWeight.bold)),
                      Text('Paris, France',
                          style: Get.textTheme.labelMedium!
                              .copyWith(color: ColorConstants.darkGrey)),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: ColorConstants.starColor,
                            size: 20,
                          ),
                          Text(
                            '4.8',
                            style: Get.textTheme.labelMedium!.copyWith(
                                color: ColorConstants.black,
                                fontWeight: FontWeight.bold),
                          ),
                          8.yh,
                          Text(
                            '  (3200 reviews)',
                            style: Get.textTheme.labelMedium!.copyWith(
                              color: ColorConstants.darkGrey,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    '70',
                    style: Get.textTheme.bodySmall!.copyWith(
                        color: ColorConstants.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "/nigth",
                    style: Get.textTheme.labelSmall!
                        .copyWith(color: ColorConstants.darkGrey),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
