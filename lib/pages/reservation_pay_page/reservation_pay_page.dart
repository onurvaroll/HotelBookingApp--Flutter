import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/booked_controller/booked_controller.dart';
import 'package:hotel/core/color.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/pages/reservation_pay_page/confirm_payment/confirm_payment.dart';
import 'package:hotel/pages/reservation_pay_page/new_card/new_card.dart';
import '../../core/static_assets.dart';
import '../../widget/button_bottom_sheet/button_bottom_sheet.dart';
import '../../widget/reservation_pay_page/group_radio_button.dart';
import '../../widget/reservation_pay_page/pay_method_card.dart';

class ReservationPayPage extends StatefulWidget {
  const ReservationPayPage({super.key});

  @override
  State<ReservationPayPage> createState() => _ReservationPayPageState();
}

class _ReservationPayPageState extends State<ReservationPayPage> {
  int _selectedMethod = -1;
  final controller = Get.put(BookedController());

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
        onPressed: () {
          if (_selectedMethod == -1) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                'Select any one Payment Type',
                style: Get.textTheme.labelMedium!.copyWith(
                    color: ColorConstants.primary, fontWeight: FontWeight.bold),
              ),
              backgroundColor: ColorConstants.red,
            ));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfirmPayment(),
                ));
          }
        },
        buttonName: 'Continue',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 16.pH,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Methods',
                    style: Get.textTheme.labelMedium!.copyWith(
                        color: ColorConstants.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewCard(),
                            ));
                      },
                      child: Text('Add New Card',
                          style: Get.textTheme.labelMedium!.copyWith(
                              color: ColorConstants.black,
                              fontWeight: FontWeight.bold)))
                ],
              ),
              PayMethodCard(
                svgImage: StaticAssets.paypal,
                payName: "Paypal",
                widget: GroupRadioButton(
                  value: 0,
                  groupValue: _selectedMethod,
                  onChanged: (value) {
                    controller.paymentMethodName = 'Paypal';
                    controller.paymentMethodIcon = 'paypal';
                    setState(() {
                      _selectedMethod = value!;
                    });
                  },
                ),
              ),
              4.yh,
              PayMethodCard(
                svgImage: StaticAssets.google,
                payName: "Google Pay",
                widget: GroupRadioButton(
                  value: 1,
                  groupValue: _selectedMethod,
                  onChanged: (value) {
                    controller.paymentMethodName='Google Pay';
                    controller.paymentMethodIcon='google';
                    setState(() {
                      _selectedMethod = value!;
                    });
                  },
                ),
              ),
              4.yh,
              PayMethodCard(
                svgImage: StaticAssets.apple,
                payName: "Apple Pay",
                widget: GroupRadioButton(
                  value: 2,
                  groupValue: _selectedMethod,
                  onChanged: (value) {
                    controller.paymentMethodName='Apple Pay';
                    controller.paymentMethodIcon='apple';
                    setState(() {
                      _selectedMethod = value!;
                    });
                  },
                ),
              ),
              4.yh,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pay With Debit/Credit Card',
                    style: Get.textTheme.labelMedium!.copyWith(
                        color: ColorConstants.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewCard(),
                            ));
                      },
                      child: Text('Change Card',
                          style: Get.textTheme.labelMedium!.copyWith(
                              color: ColorConstants.black,
                              fontWeight: FontWeight.bold)))
                ],
              ),
              PayMethodCard(
                svgImage: StaticAssets.masterCard,
                payName: "**** **** **** 1822",
                widget: GroupRadioButton(
                  value: 3,
                  groupValue: _selectedMethod,
                  onChanged: (value) {
                    controller.paymentMethodName='**** **** **** 1822';
                    controller.paymentMethodIcon='mastercard';
                    setState(() {
                      _selectedMethod = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


