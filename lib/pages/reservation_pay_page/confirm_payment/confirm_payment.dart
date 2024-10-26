import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/booked_controller/booked_controller.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/service/firestore_service.dart';
import '../../../core/color.dart';
import '../../../widget/button_bottom_sheet/button_bottom_sheet.dart';
import '../../../widget/confirm_payment_page/confirm_reservation_alert.dart';
import '../../../widget/confirm_payment_page/reservation_guest_info.dart';
import '../../../widget/confirm_payment_page/reservation_guest_info_row.dart';
import '../../../widget/confirm_payment_page/reservation_hotel_card.dart';
import '../../../widget/reservation_pay_page/pay_method_card.dart';

class ConfirmPayment extends StatelessWidget {
  ConfirmPayment({super.key});

  final BookedController bookedController = Get.find();
  final FireStoreService fireStoreService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.black),
        title: Text(
          'Payment',
          style: Get.textTheme.bodySmall!.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 0),
        ),
      ),
      bottomSheet: ButtonBottomSheet(
        buttonName: 'Confirm Payment',
        onPressed: () {
          fireStoreService.addBooked(bookedController.toModel());
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => const ConfirmReservationAlert(),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 16.pH,
          child: Column(
            children: [
              ReservationHotelCard(),
              4.yh,
              ReservationGuestInfo(
                widget: Column(
                  children: [
                    const ReservationGuestInfoRow(
                      firstInfo: 'Check In',
                      secondInfo: 'August 2,2024',
                    ),
                    const ReservationGuestInfoRow(
                      firstInfo: 'Check Out',
                      secondInfo: 'August 3,2024',
                    ),
                    ReservationGuestInfoRow(
                      firstInfo: 'Guest (Adult)',
                      secondInfo: '${bookedController.bookedAdultSize}',
                    ),
                    ReservationGuestInfoRow(
                      firstInfo: 'Guest (Child)',
                      secondInfo: '${bookedController.bookedChildSize}',
                    ),
                  ],
                ),
              ),
              4.yh,
              ReservationGuestInfo(
                widget: Column(
                  children: [
                    const ReservationGuestInfoRow(
                      firstInfo: '4 Days',
                      secondInfo: '135.00',
                    ),
                    const ReservationGuestInfoRow(
                      firstInfo: '4 Nights',
                      secondInfo: '165.00',
                    ),
                    const ReservationGuestInfoRow(
                      firstInfo: 'Taxes & Fees(%10)',
                      secondInfo: '2',
                    ),
                    1.yh,
                    Divider(
                      height: 1,
                      color: ColorConstants.darkGrey,
                    ),
                    1.yh,
                    const ReservationGuestInfoRow(
                      firstInfo: 'Total',
                      secondInfo: '479.50',
                    ),
                  ],
                ),
              ),
              4.yh,
              PayMethodCard(
                  svgImage:
                      'assets/icons/${bookedController.paymentMethodIcon}.svg',
                  payName: '${bookedController.paymentMethodName}',
                  widget: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Change',
                      style: Get.textTheme.labelLarge!.copyWith(
                          color: ColorConstants.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0),
                    ),
                  )),
              12.yh
            ],
          ),
        ),
      ),
    );
  }
}
