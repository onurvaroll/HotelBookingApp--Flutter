import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../../../controller/text_controller/text_controller.dart';
import '../../../../core/color.dart';
import '../../../../core/icon.dart';
import '../../../../core/static_assets.dart';
import '../../../../widget/alert_dialog/show_alert.dart';
import '../../../../widget/text_field/special_field.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.black),
        title: Text(
          "Forgot Password",
          style:
              Get.textTheme.bodyMedium!.copyWith(color: ColorConstants.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 16.pAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: Svg(StaticAssets.verification),
                height: 40.h,
              ),
              4.yh,
              Text(
                "Create New Password",
                textAlign: TextAlign.start,
                style: Get.textTheme.labelLarge!
                    .copyWith(color: ColorConstants.black),
              ),
              4.yh,
              SpecialField(
                obscureText: false,
                controller: TextControllers().fPasswordController,
                hintText: "Password",
                prefix: StaticIcons.password,
                suffix: StaticIcons.password,
                keyboardType: TextInputType.text,
              ),
              4.yh,
              SpecialField(
                obscureText: false,
                controller: TextControllers().refPasswordController,
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
                  onPressed: () => ShowAlert().buildShowDialog(context),
                  child: Text("Continue", style: Get.textTheme.labelLarge))
            ],
          ),
        ),
      ),
    );
  }
}
