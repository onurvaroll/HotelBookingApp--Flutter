import 'package:get/get.dart';

class OptionsController extends GetxController {
  var hotelSelectedIndex = 0.obs;
  var bookedSelectedIndex=0.obs;

  void hotelSelectIndex(int index) {
    hotelSelectedIndex.value = index;
  }
  void bookedSelectIndex(int index) {
    bookedSelectedIndex.value = index;
  }
}
