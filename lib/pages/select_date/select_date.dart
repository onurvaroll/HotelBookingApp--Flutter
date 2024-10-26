import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/core/color.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/pages/select_room/select_room.dart';
import '../../controller/booked_controller/booked_controller.dart';
import '../../widget/button_bottom_sheet/button_bottom_sheet.dart';
import '../../widget/select_hotel/calendar/custom_date_picker.dart';
import '../../widget/select_hotel/check_date_column/check_date_column.dart';
import '../../widget/select_hotel/guest_counter/guest_counter.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({super.key});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  String checkInDate = '';
  String checkOutDate = '';
  final controller = Get.put(BookedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.black),
        title: Text('Select Date',
            textAlign: TextAlign.right,
            style: Get.textTheme.bodySmall!.copyWith(
                letterSpacing: 0,
                color: ColorConstants.black,
                fontWeight: FontWeight.bold)),
      ),
      bottomSheet: ButtonBottomSheet(
        onPressed: () {
          if (controller.bookedAdultSize.value <= 0) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                '1 Adult Compulsory',
                style: Get.textTheme.labelMedium!.copyWith(
                    color: ColorConstants.primary, fontWeight: FontWeight.bold),
              ),
              backgroundColor: ColorConstants.red,
            ));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectRoom(),
                ));
          }
        },
        buttonName: 'Select Date',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 16.pH,
          child: Column(
            children: [
              const CustomDatePicker(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckDateColumn(
                    title: 'Check In Date',
                    checkSelectedDate: checkInDate,
                    icon: Icons.date_range,
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: ColorConstants.black,
                  ),
                  CheckDateColumn(
                      title: 'Check Out Date',
                      checkSelectedDate: checkOutDate,
                      icon: Icons.date_range),
                ],
              ),
              4.yh,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CheckDateColumn(
                      title: 'Check In Time',
                      checkSelectedDate: '',
                      icon: Icons.timer),
                  Icon(
                    Icons.arrow_right_alt,
                    color: ColorConstants.black,
                  ),
                  const CheckDateColumn(
                      title: 'Check Out Time',
                      checkSelectedDate: '',
                      icon: Icons.timer),
                ],
              ),
              4.yh,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CounterWidget(
                    title: 'Guest (Adult)',
                    counterSize: controller.bookedAdultSize,
                    incrementFunc: controller.incrementAdultCounter,
                    decrementFunc: controller.decrementAdultCounter,
                  ),
                  CounterWidget(
                    title: 'Guest (Child)',
                    counterSize: controller.bookedChildSize,
                    incrementFunc: controller.incrementChildCounter,
                    decrementFunc: controller.decrementChildCounter,
                  ),
                ],
              ),
              16.yh
            ],
          ),
        ),
      ),
    );
  }
}
