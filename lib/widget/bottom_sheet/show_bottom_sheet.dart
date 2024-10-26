import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/server/api/server_controller.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../core/color.dart';

class ShowBottomSheet {
  void bottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Padding(
            padding: 16.pH,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Logout",
                  style: Get.textTheme.headlineSmall!
                      .copyWith(color: ColorConstants.red,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Divider(color: ColorConstants.grey,),
                2.yh,
                Text("Are you sure you want to log out?",
                    style: Get.textTheme.labelLarge!
                        .copyWith(color: ColorConstants.black),textAlign: TextAlign.center,),
                4.yh,
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(ColorConstants.black),
                    ),
                    onPressed: () {
                      ServerController().signOut();
                      Navigator.pop(context);
                    },
                    child: const Text("Yes, Logout")),
                2.yh,
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(ColorConstants.grey),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: Get.textTheme.labelLarge!
                          .copyWith(color: ColorConstants.black),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
