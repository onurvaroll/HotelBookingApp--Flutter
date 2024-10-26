import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/core/color.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../core/static_assets.dart';
import '../../widget/notifications_page/notifications_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.black),
        title: Text(
          'Notification',
          style: Get.textTheme.bodySmall!.copyWith(
              color: ColorConstants.black, fontWeight: FontWeight.bold,letterSpacing: 0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 16.pAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'February 20, 2024',
                style: Get.textTheme.bodySmall!.copyWith(
                  color: ColorConstants.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                ),
              ),
              2.yh,
              NotificationsCard(
                icon: StaticAssets.verification,
                iconColor: ColorConstants.green,
              ),
              2.yh,
              Text(
                'February 19, 2024',
                style: Get.textTheme.bodySmall!.copyWith(
                  color: ColorConstants.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                ),
              ),
              2.yh,
              NotificationsCard(
                icon: StaticAssets.cancel,
                iconColor: ColorConstants.red,
              ),NotificationsCard(
                icon: StaticAssets.forgotPassword,
                iconColor: ColorConstants.blue,
              ),
              2.yh,
              Text(
                'February 18, 2024',
                style: Get.textTheme.bodySmall!.copyWith(
                  color: ColorConstants.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                ),
              ),
              2.yh,
              NotificationsCard(
                icon: StaticAssets.verification,
                iconColor: ColorConstants.green,
              ),
              NotificationsCard(
                icon: StaticAssets.wallet,
                iconColor: ColorConstants.greenLight,
              ),
              2.yh,
              Text(
                'February 17, 2024',
                style: Get.textTheme.bodySmall!.copyWith(
                  color: ColorConstants.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                ),
              ),
              2.yh,
              NotificationsCard(
                icon: StaticAssets.cancel,
                iconColor: ColorConstants.red,
              ),
              NotificationsCard(
                icon: StaticAssets.forgotPassword,
                iconColor: ColorConstants.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

