import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/color.dart';
import '../../widget/booking_page/booking_list_of_status/booking_list_of_status.dart';
import '../../widget/booking_page/booking_options_menu/booking_options_menu.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  // final BookingPageController bookedController =
  //     Get.put(BookingPageController());

//final BookingPageController bookedController=Get.find<BookingPageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.accessibility,
          color: Colors.black,
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "My Booking",
          style: Get.textTheme.bodySmall!.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 0),
        ),
      ),
      body: Column(
        children: [
          const BookedOptionsMenu(),
          Expanded(
            child: BookingListOfStatus(),
          ),
        ],
      ),
    );
  }
}
