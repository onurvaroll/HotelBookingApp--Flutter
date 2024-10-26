import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/server/api/server_controller.dart';
import 'package:hotel/controller/text_controller/text_controller.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../core/color.dart';

class SearchAppBar extends StatelessWidget {
   const SearchAppBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 8.pAll,
      child: TextField(
        controller: TextControllers().searchHotel,
        cursorColor: ColorConstants.black,
        decoration: InputDecoration(
          fillColor: Colors.grey[300],
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          hintText: "Search",
          hintStyle:
          Get.textTheme.bodySmall!.copyWith(
              color: ColorConstants.grey),
          prefixIcon: Icon(
            Icons.search,
            size: 30,
            color: ColorConstants.black,
          ),
        ),
        style: Get.textTheme.bodySmall!.copyWith(color: ColorConstants.black),
        onSubmitted: (value){
          ServerController().searchToPage(value);
          ServerController.recentHist.add(value);
          print('Value: $value');
        },
        // onChanged: (value){
        //   ServerController().searchToPage(value);
        //   print('Value: $value');
        // },
      ),
    );
  }
}