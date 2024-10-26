import 'package:flutter/material.dart';
import 'package:hotel/model/setting_option_model.dart';
import 'package:hotel/pages/settings/help_center/help_center_page.dart';
import 'package:hotel/pages/settings/rate/rate_page.dart';

import '../core/color.dart';
import '../pages/settings/edit_profile/edit_profile.dart';
import '../pages/settings/language/language.dart';
import '../pages/settings/notifications/notification_settings.dart';
import '../pages/settings/privacy/privacy_page.dart';
import '../widget/bottom_sheet/show_bottom_sheet.dart';

class SettingData{

  List<SettingOptionModel> settingList = [
    SettingOptionModel(text: "Edit Profile",
        leading: Icon(Icons.person,color: ColorConstants.black),
        trailing: null,
        textColor: ColorConstants.black,
        onTap: (context){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePage(),));
        }
    ),
    SettingOptionModel(text: "Notifications",
        leading: Icon(Icons.notifications_none,color: ColorConstants.black),
        trailing: null,
        textColor: ColorConstants.black,
        onTap: (context){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationSettings(),));
        }
    ),
    SettingOptionModel(text: "Dark Theme",
        leading: Icon(Icons.remove_red_eye,color: ColorConstants.black,),
        trailing: Switch(
          activeColor: ColorConstants.green,
          inactiveTrackColor: ColorConstants.grey,
          value: true,
          onChanged: (value) {
            value=!value;
          },
        ),
        textColor: ColorConstants.black,
        onTap: (context){

        }
    ),
    SettingOptionModel(text: "Language",
        leading: Icon(Icons.translate,color: ColorConstants.black),
        trailing: null,
        textColor: ColorConstants.black,
        onTap: (context){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Language(),));
        }
    ),
    SettingOptionModel(text: "Help Center",
        leading: Icon(Icons.help_outline,color: ColorConstants.black),
        trailing: null,
        textColor: ColorConstants.black,
        onTap: (context){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpCenterPage(),));
        }
    ),
    SettingOptionModel(text: "Privacy",
        leading: Icon(Icons.privacy_tip_outlined,color: ColorConstants.black),
        trailing: null,
        textColor: ColorConstants.black,
        onTap: (context){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPage(),));
        }
    ),
    SettingOptionModel(text: "Rate HotelBooking",
        leading: Icon(Icons.star_rate_outlined,color: ColorConstants.black),
        trailing: null,
        textColor: ColorConstants.black,
        onTap: (context){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RatePage(),));
        }
    ),
    SettingOptionModel(text: "Logout",
        leading: Icon(Icons.logout,color: ColorConstants.red),
        trailing: null,
        textColor: ColorConstants.red,
        onTap: (context){
      ShowBottomSheet().bottomSheet(context);
          // showModalBottomSheet<void>(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return SizedBox.expand(
          //       child: Center(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           mainAxisSize: MainAxisSize.min,
          //           children: <Widget>[
          //             const Text('Modal bottom sheet'),
          //             ElevatedButton(
          //               child: const Text('Close'),
          //               onPressed: () => Navigator.pop(context),
          //             ),
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // );
        }
    ),
  ];

  List<String> notificationList=[
    "General Notifications",
    "Sound",
    "Vibrate",
    "App Updates",
    "New Service Available",
    "New Tips Available"
  ];




}