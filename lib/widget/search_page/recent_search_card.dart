import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/server/api/server_controller.dart';
import '../../controller/text_controller/text_controller.dart';
import '../../core/color.dart';

class RecentSearchCard extends StatelessWidget {
  const RecentSearchCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            ServerController().searchToPage(ServerController.recentHist[index]);
            TextControllers().searchHotel.text=ServerController.recentHist[index];
          },
          child: Text(
            ServerController.recentHist[index],
            style:
            Get.textTheme.labelLarge!.copyWith(color: ColorConstants.black),
          ),
        ),
        IconButton(
          onPressed: () {
            ServerController.recentHist.removeAt(index);
          },
          icon: Icon(
            Icons.clear,
            color: ColorConstants.black,
          ),
        ),
      ],
    );
  }
}
