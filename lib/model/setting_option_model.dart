import 'package:flutter/material.dart';

class SettingOptionModel {
  final String text;
  final Widget? trailing;
  final Icon leading;
  final Color textColor;
  final Function (BuildContext) onTap;



  SettingOptionModel(
      {required this.text, required this.leading, required this.trailing,required this.textColor,required this.onTap});

}
