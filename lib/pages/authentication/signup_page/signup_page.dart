import 'package:flutter/material.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../../widget/authentication_page/signup_page/signin_button_widget.dart';
import '../../../widget/authentication_page/signup_page/signup_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SignUpWidget(),
            2.yh,
            Align(
              alignment: Alignment.bottomCenter,
              child: SignInButtonWidget(
                  pageController: pageController),
            ),
          ],
        ),
      ),
    );
  }
}


