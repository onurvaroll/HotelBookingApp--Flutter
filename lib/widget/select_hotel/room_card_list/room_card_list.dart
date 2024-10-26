import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/core/color.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/model/room_model.dart';

class RoomListCard extends StatelessWidget {
  const RoomListCard({
    super.key,
    required this.roomModel,
    required this.isSelected,
  });

  final RoomModel roomModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.pV,
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
            color: isSelected ? ColorConstants.black : ColorConstants.primary,
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
                            roomModel.photoUrl,
                            fit: BoxFit.cover,
                          )),
                    ),
                    4.xw,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(roomModel.name,
                            style: Get.textTheme.labelLarge!.copyWith(
                                color: isSelected
                                    ? ColorConstants.primary
                                    : ColorConstants.black,
                                fontWeight: FontWeight.bold)),
                        Text(roomModel.available,
                            style: Get.textTheme.labelSmall!.copyWith(
                                color: isSelected
                                    ? ColorConstants.lightGrey
                                    : ColorConstants.darkGrey)),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ColorConstants.starColor,
                              size: 20,
                            ),
                            Text(
                              roomModel.starRating,
                              style: Get.textTheme.labelLarge!.copyWith(
                                  color: isSelected
                                      ? ColorConstants.primary
                                      : ColorConstants.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            8.yh,
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
                      roomModel.perDay,
                      style: Get.textTheme.bodySmall!.copyWith(
                          color: isSelected
                              ? ColorConstants.primary
                              : ColorConstants.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "nigth",
                      style: Get.textTheme.labelSmall,
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
