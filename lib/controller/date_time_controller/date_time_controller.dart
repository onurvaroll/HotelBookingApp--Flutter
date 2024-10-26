import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimeController extends GetxController{
  var bookedInDate = Rxn<DateTime>();
  var bookedOutDate = Rxn<DateTime>();
  var bookedInTime = Rxn<TimeOfDay>();
  var bookedOutTime = Rxn<TimeOfDay>();

  DateTime? get getDate1 => bookedInDate.value;
  DateTime? get getDate2 => bookedOutDate.value;
  TimeOfDay? get getTime1 => bookedInTime.value;
  TimeOfDay? get getTime2 => bookedOutTime.value;

  void setInDate(DateTime date) {
    bookedInDate.value = date;
  }

  void setOutDate(DateTime date) {
    bookedOutDate.value = date;
  }

  void setInTime(TimeOfDay time) {
    bookedInTime.value = time;
  }

  void setOutTime(TimeOfDay time) {
    bookedOutTime.value = time;
  }
}