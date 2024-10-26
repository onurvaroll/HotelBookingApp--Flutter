import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../core/color.dart';
import '../../model/otel_model.dart';
import '../../pages/selected_hotel/selected_hotel.dart';

class FavoriteHotelGridCard extends StatelessWidget {
  const FavoriteHotelGridCard({
    super.key,
    required this.hotelModel,
  });

  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 4.pH,
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
            padding: 8.pAll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        hotelModel.coverPhoto,
                        fit: BoxFit.cover,
                      )),
                ),
                Text(hotelModel.hotelName,
                    textAlign: TextAlign.start,
                    style: Get.textTheme.labelMedium!.copyWith(
                        color: ColorConstants.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0)),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: ColorConstants.starColor,
                        size: 15,
                      ),
                      Text(
                        hotelModel.starRating.toString(),
                        style: Get.textTheme.labelSmall!.copyWith(
                            color: ColorConstants.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                      2.xw,
                      Text(
                        hotelModel.location,
                        style: Get.textTheme.labelSmall!.copyWith(
                            color: ColorConstants.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '\$${hotelModel.perHour.toInt()}/nigth',
                        style: Get.textTheme.labelMedium!.copyWith(
                            color: ColorConstants.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.bookmark_border_outlined,
                              color: Colors.black,
                            )),
                      )
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}