import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../../core/color.dart';
import '../../../model/room_model.dart';

class RoomGridCard extends StatelessWidget {
  const RoomGridCard({
    super.key,
    required this.roomModel,
    required this.isSelected,
  });

  final RoomModel roomModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 4.pAll,
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
            padding: 4.pAll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 20.w,
                  width: 40.w,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        roomModel.photoUrl,
                        fit: BoxFit.cover,
                      )),
                ),
                Text(roomModel.name,
                    textAlign: TextAlign.start,
                    style: Get.textTheme.labelMedium!.copyWith(
                        color: isSelected
                            ? ColorConstants.primary
                            : ColorConstants.black,
                        fontWeight: FontWeight.bold)),
                Text(roomModel.available,
                    textAlign: TextAlign.start,
                    style: Get.textTheme.labelSmall!.copyWith(
                      color: isSelected
                          ? ColorConstants.primary
                          : ColorConstants.black,
                    )),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: ColorConstants.starColor,
                      size: 15,
                    ),
                    Text(
                      '${roomModel.starRating} (3200 reviews)',
                      style: Get.textTheme.labelSmall!.copyWith(
                          color: isSelected
                              ? ColorConstants.primary
                              : ColorConstants.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${roomModel.perDay}/nigth',
                      style: Get.textTheme.labelMedium!.copyWith(
                          color: isSelected
                              ? ColorConstants.primary
                              : ColorConstants.black,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_border_outlined,
                          color: Colors.black,
                        ))
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
