import 'package:flutter/material.dart';

import '../../core/color.dart';

class GroupRadioButton extends StatelessWidget {
  const GroupRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final int value;
  final int groupValue;
  final Function(int? p1) onChanged;

  @override
  Widget build(BuildContext context) {
    return Radio<int>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: ColorConstants.black,
      fillColor: MaterialStateProperty.all<Color>(ColorConstants.black),
    );
  }
}
