import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:hotel/core/color.dart';
import '../../../widget/button_bottom_sheet/button_bottom_sheet.dart';

class NewCard extends StatefulWidget {
   const NewCard({super.key});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Credit Card Form',
          style: Get.textTheme.bodySmall!.copyWith(color: ColorConstants.black),
        ),
      ),
      bottomSheet: ButtonBottomSheet(
        onPressed: () {

        },
        buttonName: 'Continue',
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ShowCreditCard(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                isCvvFocused: isCvvFocused,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      inputConfiguration: InputConfiguration(
                        cardHolderTextStyle: Get.textTheme.bodySmall!
                            .copyWith(color: ColorConstants.black),
                        cardNumberTextStyle: Get.textTheme.bodySmall!
                            .copyWith(color: ColorConstants.black),
                        cvvCodeTextStyle: Get.textTheme.bodySmall!
                            .copyWith(color: ColorConstants.black),
                        expiryDateTextStyle: Get.textTheme.bodySmall!
                            .copyWith(color: ColorConstants.black),
                        expiryDateDecoration: InputDecoration(
                          filled: true,
                          fillColor: ColorConstants.lightGrey,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: ColorConstants.black, width: 2.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: ColorConstants.darkGrey),
                          ),
                          border:  const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          hintText: 'Expiry',
                        ),
                        cardNumberDecoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: ColorConstants.black, width: 2.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: ColorConstants.darkGrey),
                          ),
                          filled: true,
                          fillColor: ColorConstants.lightGrey,
                          border:  const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          hintText: 'Card Number',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          filled: true,
                          fillColor: ColorConstants.lightGrey,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: ColorConstants.black, width: 2.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: ColorConstants.darkGrey),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'CVV',
                        ),
                        cardHolderDecoration: InputDecoration(
                          filled: true,
                          fillColor: ColorConstants.lightGrey,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: ColorConstants.black, width: 2.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: ColorConstants.darkGrey),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Holder Name',
                          //labelText: 'Card Holder',
                        ),
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(8.0),
                    //     ),
                    //   ),
                    //   child: Container(
                    //     margin:  EdgeInsets.all(12),
                    //     child:  Text(
                    //       'Validate',
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontFamily: 'halter',
                    //         fontSize: 16,
                    //         package: 'flutter_credit_card',
                    //       ),
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     if (formKey.currentState!.validate()) {
                    //       print('Valid!');
                    //     } else {
                    //       print('Invalid!');
                    //     }
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel?.cardNumber ?? '';
      expiryDate = creditCardModel?.expiryDate ?? '';
      cardHolderName = creditCardModel?.cardHolderName ?? '';
      cvvCode = creditCardModel?.cvvCode ?? '';
      isCvvFocused = creditCardModel?.isCvvFocused ?? false;
    });
  }
}

class ShowCreditCard extends StatelessWidget {
   const ShowCreditCard({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.isCvvFocused,
  });

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isCvvFocused;

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      isHolderNameVisible: true,
      enableFloatingCard: true,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      showBackView: isCvvFocused,
      obscureCardNumber: false,
      obscureCardCvv: false,
      height: Get.size.height * 0.3,
      width: Get.size.width,
      animationDuration:  const Duration(milliseconds: 1000),
      cardType: CardType.visa,
      onCreditCardWidgetChange: (CreditCardBrand? creditCardBrand) {},
    );
  }
}
