import 'package:flutter/material.dart';
import 'package:hotel/extentions/extentions.dart';

import 'other_signin_button.dart';

class OtherSignInList extends StatelessWidget {
  const OtherSignInList({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: OtherSignButtons(index: index,)
          );
        },
      ),
    );
  }
}