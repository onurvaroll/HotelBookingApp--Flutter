import 'package:get/get.dart';
import 'package:hotel/service/firestore_service.dart';
import '../../model/booked_model.dart';
import '../../service/auth.dart';

class BookingPageController extends GetxController {
  final fireStoreService = Get.find<FireStoreService>();
  final AuthorizationService auth = Get.find<AuthorizationService>();
  RxString activeUserId = ''.obs;

  var ongoing = <BookedModel>[].obs;
  var completed = <BookedModel>[].obs;
  var canceled = <BookedModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    listOfType();
    activeUserId.value=auth.activeUserId.value;
  }

  void listOfType() async {
    try {
      List<BookedModel> bookingsList =
          await fireStoreService.getBooked(activeUserId.value);

      ongoing.assignAll(
        bookingsList
            .where((booking) => booking.bookedStatus == 'ongoing')
            .toList(),
      );

      completed.assignAll(
        bookingsList
            .where((booking) => booking.bookedStatus == 'completed')
            .toList(),
      );

      canceled.assignAll(
        bookingsList
            .where((booking) => booking.bookedStatus == 'canceled')
            .toList(),
      );
    } catch (e) {
      print("Error fetching bookings: $e");
    }
  }
}
