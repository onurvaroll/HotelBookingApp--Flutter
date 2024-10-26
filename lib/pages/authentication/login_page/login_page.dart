import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import 'package:sign_in_button/sign_in_button.dart';

import '../../../core/color.dart';
import '../../../widget/authentication_page/divider_with_text.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$provider Button Pressed!',style: Get.textTheme.labelMedium!.copyWith(color:ColorConstants.black),),
        backgroundColor: ColorConstants.green,
        duration: const Duration(milliseconds: 400),
      ),
    );
  }

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: 12.pH,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Lets you in",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleSmall!
                      .copyWith(color: ColorConstants.black,fontWeight: FontWeight.bold),
                ),
                SignInButton(
                  Buttons.facebook,
                  onPressed: () {
                    _showButtonPressDialog(context, 'Facebook');
                  },
                ),
                4.yh,
                SignInButton(
                  Buttons.google,
                  onPressed: () {
                    _showButtonPressDialog(context, 'Google');
                  },
                ),
                4.yh,
                SignInButton(
                  Buttons.apple,
                  onPressed: () {
                    _showButtonPressDialog(context, 'Apple');
                  },
                ),
                const DividerWithText(
                  text: 'or',
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(ColorConstants.black),
                  ),
                  onPressed: () {

                    if (_pageController.hasClients) {
                      _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Text("Sign in with Password"),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 2,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account",
                  style: Get.textTheme.labelLarge!
                      .copyWith(color: ColorConstants.black),
                ),
                TextButton(
                  onPressed: () {
                    if (_pageController.hasClients) {
                      _pageController.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    "Sign up",
                    style: Get.textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.black),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

