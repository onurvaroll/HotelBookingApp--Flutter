import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../core/color.dart';
import '../../model/otel_model.dart';
import '../../pages/selected_hotel/selected_hotel.dart';

class FavoriteHotelListCard extends StatelessWidget {
  const FavoriteHotelListCard({
    super.key,
    required this.hotelModel,
  });

  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 4.pV,
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectedHotel(selectedHotel: hotelModel),
            )),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              hotelModel.coverPhoto,
                              fit: BoxFit.cover,
                            )),
                      ),
                      4.xw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(hotelModel.hotelName,
                              style: Get.textTheme.labelMedium!.copyWith(
                                  color: ColorConstants.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0)),
                          Text(hotelModel.location,
                              style: Get.textTheme.labelSmall!
                                  .copyWith(color: ColorConstants.darkGrey)),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: ColorConstants.starColor,
                                size: 20,
                              ),
                              Text(
                                hotelModel.starRating.toString(),
                                style: Get.textTheme.labelMedium!.copyWith(
                                    color: ColorConstants.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              ),
                              4.yh,
                              const Text(
                                '  (3200 reviews)',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
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
                        '\$${hotelModel.perHour.toInt()}',
                        style: Get.textTheme.labelLarge!.copyWith(
                            color: ColorConstants.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "/nigth",
                        style: Get.textTheme.labelSmall!.copyWith(
                            fontSize: 8,
                            color: ColorConstants.black,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.black,
                          ))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
