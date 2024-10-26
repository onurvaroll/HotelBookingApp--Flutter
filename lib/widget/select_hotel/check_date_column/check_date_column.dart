
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../../core/color.dart';

class CheckDateColumn extends StatelessWidget {
  const CheckDateColumn({
    super.key,
    required this.checkSelectedDate,
    required this.title, required this.icon,
  });

  final String checkSelectedDate;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Get.textTheme.labelMedium!.copyWith(
              color: ColorConstants.black, fontWeight: FontWeight.bold),
        ),
        2.yh,
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 8.h,
            width: 40.w,
            decoration: BoxDecoration(
                color: ColorConstants.lightGrey,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: ListTile(
                  title: checkSelectedDate != ''
                      ? Text(
                    checkSelectedDate,
                    style: Get.textTheme.labelMedium!.copyWith(
                        color: ColorConstants.black,
                        fontWeight: FontWeight.bold),
                  )
                      : Text(
                    title,
                    style: Get.textTheme.labelMedium!
                        .copyWith(color: ColorConstants.darkGrey),
                  ),
                  trailing: Icon(icon,color: ColorConstants.darkGrey,),
                )
            ),
          ),
        )
      ],
    );
  }
}