import 'package:get/get.dart';
import 'package:hotel/controller/text_controller/text_controller.dart';
import 'package:hotel/service/firestore_service.dart';


class SearchController extends GetxController{
FireStoreService fireStoreService=Get.find();
TextControllers textControllers =Get.find();

static List searchList=[].obs;
final String searchText;

  SearchController({required this.searchText});


// @override
//   void onInit() async{
//     super.onInit();
//     searchList = await fireStoreService.searchHotel(searchText);
//   }

  Future<void> getSearchList()async {
  searchList= await fireStoreService.searchHotel(textControllers.searchHotel.text);
  }

}