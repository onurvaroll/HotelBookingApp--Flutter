import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';


import '../../controller/option_controller/option_controller.dart';
import '../../core/color.dart';
import '../../enums/options_names.dart';

class HotelsOptionsButton extends StatelessWidget {
  final int index;
  const HotelsOptionsButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final OptionsController controller = Get.find();
    return Obx(() {
      bool isSelected = controller.hotelSelectedIndex.value == index;

      return GestureDetector(
        onTap: () {
          controller.hotelSelectIndex(index); // Update the selected index
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(),
            color: isSelected ? ColorConstants.black : ColorConstants.primary, // Change color if selected
          ),
          child: Padding(
            padding: 8.pAll,
            child: Text(
              OptionNames.values[index].toString().toUpperCase().split('.').last,
              style: Get.textTheme.labelSmall!.copyWith(
                color: isSelected? ColorConstants.primary:ColorConstants.black,
              ),
            ),
          ),
        ),
      );
    });
  }
}
