import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../core/color.dart';

class HomePageSearch extends StatelessWidget {
  const HomePageSearch({
    super.key,
    required this.onSearchSubmit,
  });

  final VoidCallback onSearchSubmit;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorConstants.green,
      style: Get.textTheme.labelLarge!.copyWith(color: ColorConstants.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        hintText: "Search",
        prefixIcon: Icon(Icons.search, size: 30, color: ColorConstants.green),
        suffixIcon: Icon((Icons.settings), color: ColorConstants.green),
      ),
      onSubmitted: (value) {
        onSearchSubmit();
        print(value);
      },
    );
  }
}

class HomePageSearchButton extends StatelessWidget {
  const HomePageSearchButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.size.height*0.08,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: ColorConstants.lightGrey
        ),
        child: Padding(
          padding: 8.pAll,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.search, size: 30, color: ColorConstants.green),
                  1.xw,
                  Text('Search',style: Get.textTheme.labelLarge!.copyWith(color: ColorConstants.darkGrey),),
                ],
              ),

              Icon((Icons.settings), color: ColorConstants.green),
            ],
          ),
        ),
      ),
    );
  }
}
