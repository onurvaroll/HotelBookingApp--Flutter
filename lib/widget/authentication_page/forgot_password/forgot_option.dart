import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../../core/static_assets.dart';

class ForgotOption extends StatelessWidget {
  final Function(bool) onSelectOption;

  const ForgotOption({super.key, required this.onSelectOption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.pAll,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onSelectOption(true); // SMS seçeneği
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                  color: Colors.greenAccent),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  backgroundImage: Svg(StaticAssets.sms),
                ),
                title: Text(
                  "Via SMS",
                  style: Get.textTheme.labelLarge!.copyWith(color: Colors.grey),
                ),
                subtitle: Text("Enter Mobile Number",
                    style: Get.textTheme.labelMedium!.copyWith(color: Colors.black)),
              ),
            ),
          ),
          4.yh,
          GestureDetector(
            onTap: () {
              onSelectOption(false); // E-mail seçeneği
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                  color: Colors.greenAccent),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: Svg(StaticAssets.mail),
                  backgroundColor: Colors.grey,
                ),
                title: Text(
                  "Via E-mail",
                  style: Get.textTheme.labelLarge!.copyWith(color: Colors.grey),
                ),
                subtitle: Text("Enter E-mail ID",
                    style: Get.textTheme.labelMedium!.copyWith(color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
