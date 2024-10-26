import 'package:flutter/material.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../../widget/authentication_page/divider_with_text.dart';
import '../../../widget/authentication_page/login_page/other_signin_list.dart';
import '../../../widget/authentication_page/signin_page/signin_widget.dart';
import '../../../widget/authentication_page/signin_page/signup_button_widget.dart';


class SignInPage extends StatelessWidget {
  const SignInPage({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SignInWidget(),
            2.yh,
            const DividerWithText(text: "or continue with"),
            2.yh,
            const OtherSignInList(),
            2.yh,
            Align(
              alignment: Alignment.bottomCenter,
              child: SignUpButtonWidget(pageController: pageController),
            ),
          ],
        ),
      ),
    );
  }
}







