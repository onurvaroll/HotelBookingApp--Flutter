import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../../controller/server/api/server_controller.dart';
import '../../../controller/text_controller/text_controller.dart';
import '../../../core/color.dart';
import '../../../core/icon.dart';
import '../../../pages/main_pages/main_pages.dart';
import '../../text_field/special_field.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 12.pH,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Create your Account",
              textAlign: TextAlign.start,
              style: Get.textTheme.titleSmall!
                  .copyWith(color: ColorConstants.black,fontWeight: FontWeight.bold),
            ),
            4.yh,
            SpecialField(
              obscureText: false,
              controller: TextControllers().newNameController,
              hintText: "Name",
              prefix: StaticIcons.email,
              suffix: StaticIcons.email,
              keyboardType: TextInputType.text,
            ),
            4.yh,
            SpecialField(
              obscureText: false,
              controller: TextControllers().newMailController,
              hintText: "E-mail",
              prefix: StaticIcons.email,
              suffix: StaticIcons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            4.yh,
            SpecialField(
              obscureText: true,
              controller: TextControllers().newPasswordController,
              hintText: "Password",
              prefix: StaticIcons.email,
              suffix: StaticIcons.email,
              keyboardType: TextInputType.text,
            ),
            4.yh,
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(ColorConstants.black),
              ),
              onPressed: () {
                ServerController().newUser();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPages(),));

              },
              child: const Text("Sign up"),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By signing up you agree to LearnEase\'s ',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'Terms of Services and Privacy Policy.',
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
