import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../core/color.dart';
import '../onboarding_page/onboarding_page.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SizedBox(
          height: 100.h,
          width: 100.w,
          child: Image.asset(
            "assets/images/sunsett.jpg",
            fit: BoxFit.cover,
          )),
      Positioned(
          bottom: 8.h,
          left: 8.w,
          right: 12.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to",
                style: Get.theme.textTheme.bodyLarge!.copyWith(
                  color: ColorConstants.primary,
                ),
              ),
              2.yh,
              Text(
                "Hotel Booking",
                style: Get.theme.textTheme.titleSmall!.copyWith(color: ColorConstants.green, fontWeight: FontWeight.bold),
              ),
              2.yh,
              Text(
                "The best hotel booking in this century to accompany your vacation",
                style: Get.theme.textTheme.labelSmall!,
              ),
            ],
          )),
      Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
            onPressed: () {
              //HotelUploader().addHotelsToFirestore();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnboardingPage(),
                  ));
            },
            icon: Icon(
              Icons.navigate_next,
              size: 48,
              color: ColorConstants.primary,
            )),
      )
    ]
        )
    );
  }
}
