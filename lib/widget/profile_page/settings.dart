import 'package:flutter/material.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/widget/profile_page/setting_option.dart';

import '../../model/setting_data.dart';



class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: SettingData().settingList.length,
      padding: 8.pAll,
      itemBuilder: (context, index) {
        return SettingOption(
            settingOptionModel: SettingData().settingList[index]);
      },
    );
  }
}