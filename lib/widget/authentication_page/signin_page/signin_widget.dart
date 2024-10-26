import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../../controller/server/api/server_controller.dart';
import '../../../controller/text_controller/text_controller.dart';
import '../../../core/color.dart';
import '../../../core/icon.dart';
import '../../../pages/authentication/forgot_password/forgot_password/forgot_password.dart';
import '../../../pages/main_pages/main_pages.dart';
import '../../text_field/special_field.dart';
//import '../../../pages/dataset2.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 12.pH,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Login to your Account",
            textAlign: TextAlign.start,
            style:
                Get.textTheme.titleSmall!.copyWith(color: ColorConstants.black),
          ),
          4.yh,
          SpecialField(
            obscureText: false,
            controller: TextControllers().mailController,
            hintText: "E-mail",
            prefix: StaticIcons.email,
            suffix: StaticIcons.email,
            keyboardType: TextInputType.emailAddress,
          ),
          4.yh,
          SpecialField(
            obscureText: true,
            controller: TextControllers().passwordController,
            hintText: "Password",
            prefix: StaticIcons.password,
            suffix: StaticIcons.password,
            keyboardType: TextInputType.text,
          ),
          4.yh,
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorConstants.black),
            ),
            onPressed: () async{
             ServerController().signIn(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPages(),
                ),
              );
            },
            child: const Text("Sign in"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPassword(),
                  ));
            },
            child: Text(
              "Forgot the password?",
              style: Get.textTheme.labelLarge!
                  .copyWith(color: ColorConstants.green),
            ),
          ),
        ],
      ),
    );
  }
}
