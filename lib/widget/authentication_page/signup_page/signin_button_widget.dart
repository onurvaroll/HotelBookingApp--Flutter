import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/color.dart';

class SignInButtonWidget extends StatelessWidget {
  const SignInButtonWidget({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account",
          style: Get.textTheme.labelLarge!
              .copyWith(color: ColorConstants.black),
        ),
        TextButton(
          onPressed: () {
            if (pageController.hasClients) {
              pageController.animateToPage(
                2,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Text(
            "Sign in",
            style: Get.textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorConstants.black),
          ),
        )
      ],
    );
  }
}