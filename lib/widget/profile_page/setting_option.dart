import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/setting_option_model.dart';

class SettingOption extends StatefulWidget {
  const SettingOption({
    super.key, required this.settingOptionModel});

  final SettingOptionModel settingOptionModel;

  @override
  State<SettingOption> createState() => _SettingOptionState();
}

class _SettingOptionState extends State<SettingOption> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> widget.settingOptionModel.onTap(context),
      child: ListTile(
        leading: widget.settingOptionModel.leading,
        trailing: widget.settingOptionModel.trailing,
        title: Text(
          widget.settingOptionModel.text,
          style: Get.textTheme.bodySmall!
              .copyWith(color: widget.settingOptionModel.textColor),
        ),
      ),
    );
  }
}
