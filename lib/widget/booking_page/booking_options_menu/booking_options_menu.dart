import 'package:flutter/material.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../../enums/booking_category.dart';
import '../booked_options_button/booked_options_button.dart';

class BookedOptionsMenu extends StatelessWidget {
  const BookedOptionsMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 8.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: 12.pAll,
          itemCount: BookingCategory.values.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: 8.pH,
              child: BookedOptionsButton(index: index),
            );
          },
        ),
      ),
    );
  }
}
