import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../../controller/booked_controller/booked_controller.dart';
import '../../../controller/option_controller/option_controller.dart';
import '../../../model/booked_model.dart';
import '../../../service/auth.dart';
import '../booked_hotel_card/booked_hotel_card.dart';

class BookingListOfStatus extends StatelessWidget {
  BookingListOfStatus({
    super.key,
  });
  final bookedController=Get.put(BookedController());
  final OptionsController optController = Get.find();
  final AuthorizationService auth = Get.find<AuthorizationService>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selectedIndex = optController.bookedSelectedIndex.value;
      List<BookedModel> bookedHotels;
      bookedController.activeUserId.value=auth.activeUserId.value;
      if (selectedIndex == 0) {
        bookedHotels = bookedController.ongoing;
      } else if (selectedIndex == 1) {
        bookedHotels = bookedController.completed;
      } else {
        bookedHotels = bookedController.canceled;
      }

      return ListView.builder(
        itemCount: bookedHotels.length,
        itemBuilder: (context, index) => Padding(
          padding: 16.pAll,
          child: BookedHotelCard(
            bookedModel: bookedHotels[index],
          ),
        ),
      );
    });
  }
}