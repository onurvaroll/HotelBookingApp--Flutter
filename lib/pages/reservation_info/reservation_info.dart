import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/core/color.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/pages/reservation_pay_page/reservation_pay_page.dart';
import 'package:hotel/widget/text_field/special_field.dart';
import '../../controller/booked_controller/booked_controller.dart';
import '../../controller/text_controller/text_controller.dart';
import '../../core/icon.dart';
import '../../widget/button_bottom_sheet/button_bottom_sheet.dart';

class ReservationInfo extends StatefulWidget {
  const ReservationInfo({super.key});

  @override
  State<ReservationInfo> createState() => _ReservationInfoState();
}

class _ReservationInfoState extends State<ReservationInfo> {
  String selectedGender = 'Male';
  List<String> countryCodes = ['+90', '+1', '+44', '+49', '+33', '+323'];
  List<String> genders = ['Male', 'Female', 'Other'];
  final controller = Get.put(BookedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Of Reservation',
            style: Get.textTheme.bodySmall!.copyWith(
                color: ColorConstants.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 0)),
        iconTheme: IconThemeData(color: ColorConstants.black),
      ),
      bottomSheet: ButtonBottomSheet(
        onPressed: () {
          if (TextControllers().reservedName.text.isEmpty ||
              TextControllers().reservedPhone.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                'Full Name and Phone required ',
                style: Get.textTheme.labelMedium!.copyWith(
                    color: ColorConstants.primary, fontWeight: FontWeight.bold),
              ),
              backgroundColor: ColorConstants.red,
            ));
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ReservationPayPage(),));
          }
        },
        buttonName: 'Continue',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 16.pAll,
          child: Column(
            children: [
              SizedBox(
                height: Get.size.height * 0.1,
                child: SpecialField(
                  obscureText: false,
                  controller: TextControllers().reservedName,
                  hintText: 'Full Name',
                  prefix: const SizedBox(),
                  suffix: const SizedBox(),
                  keyboardType: TextInputType.name,
                ),
              ),
              4.yh,
              SizedBox(
                height: Get.size.height * 0.1,
                child: CustomDropdown(
                  items: genders,
                  selectedValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
              ),
              4.yh,
              SizedBox(
                height: Get.size.height * 0.1,
                child: DatePickerButton(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2028),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Colors.yellow,
                              onPrimary: Colors.black,
                              onSurface: ColorConstants.black,
                            ),
                            datePickerTheme: DatePickerThemeData(
                              confirmButtonStyle: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorConstants.grey),
                              ),
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                  },
                ),
              ),
              4.yh,
              SizedBox(
                height: Get.size.height * 0.1,
                child: SpecialField(
                  obscureText: false,
                  controller: TextControllers().reservedMail,
                  hintText: 'E-Mail',
                  prefix: const SizedBox(),
                  suffix: StaticIcons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              4.yh,
              SizedBox(
                height: Get.size.height * 0.1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorConstants.lightGrey,
                        ),
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(20),
                          alignment: Alignment.center,
                          value: controller.bookedUserPhoneCode,
                          underline: const SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              controller.bookedUserPhoneCode = newValue!;
                            });
                            print(controller.bookedUserPhoneCode);
                          },
                          items: countryCodes.map((String code) {
                            return DropdownMenuItem<String>(
                              value: code,
                              child: Text(code,
                                  style: Get.textTheme.labelMedium!
                                      .copyWith(color: ColorConstants.black)),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    4.xw,
                    Expanded(
                      flex: 5,
                      child: SpecialField(
                        obscureText: false,
                        controller: TextControllers().reservedPhone,
                        hintText: 'Phone Number',
                        prefix: const SizedBox(),
                        suffix: StaticIcons.email,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
              ),
              12.yh
            ],
          ),
        ),
      ),
    );
  }
}

class DatePickerButton extends StatelessWidget {
  const DatePickerButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: 16.pAll,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: ColorConstants.lightGrey,
            borderRadius: BorderRadius.circular(20)),
        child: Text('Date',
            style: Get.textTheme.labelLarge!
                .copyWith(color: ColorConstants.black)),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String selectedValue;
  final Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.pH,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorConstants.lightGrey,
      ),
      child: DropdownButton<String>(
        hint: const Text('Gender'),
        value: selectedValue,
        isExpanded: true,
        underline: const SizedBox(),
        onChanged: onChanged,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: Get.textTheme.labelLarge!
                  .copyWith(color: ColorConstants.black),
            ),
          );
        }).toList(),
      ),
    );
  }
}
