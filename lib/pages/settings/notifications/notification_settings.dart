import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/color.dart';
import '../../../model/setting_data.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  List<bool> switchValues = List.generate(8, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.black),
        title: Text(
          "Notifications",
          style: Get.textTheme.bodySmall!.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 0),
        ),
      ),
      body: ListView.builder(
        itemCount: SettingData().notificationList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                SettingData().notificationList[index],
                style: Get.textTheme.labelLarge!.copyWith(
                  color: ColorConstants.black,
                ),
              ),
              Switch(
                value: switchValues[index],
                onChanged: (value) {
                  setState(() {
                    switchValues[index] = value;
                  });
                },
                activeColor: ColorConstants.black,
                inactiveThumbColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
