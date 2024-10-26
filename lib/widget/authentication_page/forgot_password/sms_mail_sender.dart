import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';


import '../../../core/color.dart';
import '../../../core/static_assets.dart';
import '../../../pages/authentication/forgot_password/verification/verification_page.dart';

class SendToMailAndSms extends StatelessWidget {
   SendToMailAndSms({
    super.key, required this.option,
  });
  final bool option;
  final TextEditingController controller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.pAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black),
                color: Colors.greenAccent),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                backgroundImage: Svg(StaticAssets.sms),
              ),
              title: Text(
                option?"Via SMS":"E-Mail",
                style: Get.textTheme.labelLarge!.copyWith(color: Colors.grey),
              ),
              subtitle: TextField(
                controller: controller,
                style: Get.textTheme.labelLarge!.copyWith(color: ColorConstants.black),
                keyboardType: option ? TextInputType.phone : TextInputType.emailAddress,
                cursorColor: ColorConstants.black,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: ColorConstants.black, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: ColorConstants.green, width: 2.0),
                  ),
                  hintText: option ? "SMS" : "E-Mail",
                  hintStyle: Get.textTheme.labelLarge!.copyWith(color: ColorConstants.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: ColorConstants.black),
                  ),
                ),
              ),
            ),
          ),
          16.yh,
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationPage(cmInfo: controller.text,),));
          },
            style: ButtonStyle(backgroundColor:  MaterialStateProperty.all<Color>(ColorConstants.black),
            ),
            child: Text("Continue",
              style: Get.textTheme.labelLarge!.copyWith(
              ),),
          ),
        ],
      ),
    );
  }
}
