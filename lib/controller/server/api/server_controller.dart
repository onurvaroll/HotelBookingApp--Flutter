import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/model/user_model.dart';
import 'package:hotel/service/firestore_service.dart';
import '../../../model/otel_model.dart';
import '../../../service/auth.dart';
import '../../text_controller/text_controller.dart';
import '../base/base_server_controller.dart';

class ServerController extends BaseServerController {
  AuthorizationService auth = AuthorizationService();
  FireStoreService fireStore = FireStoreService();
  TextControllers textControllers = TextControllers();
  static List<HotelModel> searchList = <HotelModel>[].obs;
  static List<String> recentHist=<String>[].obs;

  newUser() async {
    UserModel? user = await auth.createUser(
        textControllers.newMailController.text,
        textControllers.newPasswordController.text);
    if (user != null) {
      fireStore
          .saveUser(
              user: UserModel(
            id: user.id,
            fullName: textControllers.newNameController.text,
            name: textControllers.newNameController.text,
            email: textControllers.newMailController.text,
            photoUrl: user.photoUrl,
            phoneNumber: user.phoneNumber,
            gender: user.gender,
            birthDay: user.birthDay,
          ))
          .then((value) => print("User saved to Firestore"));
    }
  }

  signIn(BuildContext context) {
    //var user=
    auth.signIn(textControllers.mailController.text,
        textControllers.passwordController.text);
    // if(user==null){
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('E-mail or password is incorrect',style: Get.textTheme.labelMedium!.copyWith(color:ColorConstants.black),),
    //       backgroundColor: ColorConstants.green,
    //       duration: const Duration(milliseconds: 400),
    //     ),
    //   );
    //   return false;
    // }
    // else {
    //   return true;
    // }
  }

  signOut() {
    auth.signOut();
  }

  searchToPage(String text) async{
    var result = await fireStore.searchHotel(text);
    searchList.assignAll(result);
  }
  Future<List<HotelModel>> newMetod(String text)async{
    List<HotelModel> hotels;
    var result = await fireStore.searchHotel(text);
    hotels=result;

    return hotels;
  }

  searchToHome() async{
   searchList=await fireStore.searchHotel(textControllers.searchHotel.text);
   print('Metod2: ${searchList.length}');

  }
}
