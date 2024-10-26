import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../core/color.dart';
import '../../widget/profile_page/profile_details.dart';
import '../../widget/profile_page/settings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: Get.textTheme.bodySmall!.copyWith(
              color: ColorConstants.black, fontWeight: FontWeight.bold,letterSpacing: 0),
        ),
        leading: Icon(
          Icons.accessibility_new_outlined,
          color: ColorConstants.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: 8.pH,
              child: const ProfileDetails(),
            ),
            2.yh,
            Divider(
              color: ColorConstants.black,
            ),
            Padding(
              padding: 8.pH,
              child: const Settings(),
            )
          ],
        ),
      ),
    );
  }
}
