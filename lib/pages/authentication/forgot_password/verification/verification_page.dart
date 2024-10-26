import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';

import '../../../../core/color.dart';
import '../new_password/new_password.dart';


class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key, required this.cmInfo});
  final String cmInfo;
  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());


  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.black),
        title: Text(
          "Forgot Password",
          style: Get.textTheme.bodyMedium!.copyWith(color: ColorConstants.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Get.textTheme.labelLarge!.copyWith(color: ColorConstants.black),
                children: [
                  const TextSpan(text: "Code has been sent to "),
                  TextSpan(
                    text: widget.cmInfo,
                    style: Get.textTheme.labelLarge!.copyWith(
                        color: ColorConstants.black,
                        fontWeight: FontWeight.bold,),
                  ),
                ],
              ),
            ),
            4.yh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: TextField(
                    controller: _controllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: Get.textTheme.labelLarge!.copyWith(color: ColorConstants.black),
                    decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorConstants.black, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorConstants.green, width: 2.0),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index < 3) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    onSubmitted: (value){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateNewPassword(),));
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
