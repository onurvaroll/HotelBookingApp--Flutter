
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/color.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    super.key,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime today = DateTime.now();

  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  DateTime? rangeStart;
  DateTime? rangeEnd;

  @override
  void initState() {
    super.initState();
    selectedDay = focusedDay;
  }

  void onDaySelected(DateTime sDay, DateTime fDay) {
    if (!isSameDay(selectedDay, focusedDay)) {
      setState(() {
        selectedDay = sDay;
        focusedDay = fDay;
      });
    }
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusDay) {
    setState(() {
      selectedDay = null;
      focusedDay = focusDay;
      rangeStart = start;
      rangeEnd = end;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TableCalendar(
        locale: "en_US",
        focusedDay: today,
        firstDay: DateTime.utc(2014, 1, 1),
        lastDay: DateTime.utc(2034, 1, 1),
        rowHeight: 40,
        rangeStartDay: rangeStart,
        rangeEndDay: rangeEnd,
        onRangeSelected: onRangeSelected,
        rangeSelectionMode: RangeSelectionMode.toggledOn,
        startingDayOfWeek: StartingDayOfWeek.monday,
        headerStyle: HeaderStyle(
          titleTextStyle: Get.textTheme.labelMedium!.copyWith(
              color: ColorConstants.black, fontWeight: FontWeight.bold),
          formatButtonVisible: false,
          titleCentered: true,
        ),
        calendarStyle: CalendarStyle(
            withinRangeTextStyle:
            Get.textTheme.labelSmall!.copyWith(color: ColorConstants.black),
            rangeEndTextStyle:
            Get.textTheme.labelSmall!.copyWith(color: ColorConstants.red),
            rangeStartTextStyle:
            Get.textTheme.labelSmall!.copyWith(color: ColorConstants.green),
            holidayTextStyle:
            Get.textTheme.labelSmall!.copyWith(color: ColorConstants.black),
            outsideTextStyle:
            Get.textTheme.labelSmall!.copyWith(color: ColorConstants.black),
            weekendTextStyle:
            Get.textTheme.labelSmall!.copyWith(color: ColorConstants.red),
            defaultTextStyle:
            Get.textTheme.labelSmall!.copyWith(color: ColorConstants.black),
            outsideDaysVisible: false),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle:
          Get.textTheme.labelSmall!.copyWith(color: ColorConstants.black),
          weekendStyle:
          Get.textTheme.labelSmall!.copyWith(color: ColorConstants.red),
        ),
        onFormatChanged: (format) {
          if (calendarFormat != format) {
            setState(() {
              calendarFormat = format;
            });
          }
        },
        availableGestures: AvailableGestures.all,
      ),
    );
  }
}