import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../core/color.dart';
import '../../core/static_assets.dart';
import '../../pages/main_pages/main_pages.dart';

class ShowAlert {
  Future<String?> buildShowDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        alignment: Alignment.center,
        actionsAlignment: MainAxisAlignment.center,
        title: Column(
          children: [
            Image(image: Svg(StaticAssets.verification),height: 20.h,),
            Text(
              'Congralutions',
              style:
                  Get.textTheme.bodyMedium!.copyWith(color: ColorConstants.black),
            ),
          ],
        ),
        content: Text(
          'Your account is ready to use',
          style:
              Get.textTheme.labelLarge!.copyWith(color: ColorConstants.black),
        ),
        actions: <Widget>[
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.black)),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPages(),
              ),
            ),
            child: const Text('Go to HomePage'),
          ),
        ],
      ),
    );
  }
}
