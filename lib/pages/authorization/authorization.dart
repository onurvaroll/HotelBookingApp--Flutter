import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/model/user_model.dart';
import 'package:hotel/pages/main_pages/main_pages.dart';
import 'package:hotel/pages/welcome_page/welcome_page.dart';
import 'package:hotel/service/auth.dart';

class Authorization extends StatelessWidget {
  const Authorization({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthorizationService auth = Get.find<AuthorizationService>();
    return StreamBuilder<UserModel?>(
        stream: auth.authStatus, builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator());
          }else{
            if(snapshot.hasData){
              UserModel? activeUser=snapshot.data;
              auth.activeUserId.value=activeUser!.id!;
              print(auth.activeUserId);
              return const MainPages();
            }else{
              return const WelcomePage();
            }
          }
    }
    );
  }
}
