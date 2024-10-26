import 'package:get/get.dart';
import 'package:hotel/controller/text_controller/text_controller.dart';
import 'package:hotel/model/otel_model.dart';
import '../../model/booked_model.dart';
import '../../service/auth.dart';
import '../../service/firestore_service.dart';

class BookedController extends GetxController {
  final AuthorizationService auth = Get.find<AuthorizationService>();
  final fireStoreService = Get.find<FireStoreService>();
  RxString activeUserId = ''.obs;

  var ongoing = <BookedModel>[].obs;
  var completed = <BookedModel>[].obs;
  var canceled = <BookedModel>[].obs;
  var favorite=<HotelModel>[].obs;

  void listOfType() async {
    try {
      List<BookedModel> bookingsList =
      await fireStoreService.getBooked(bookedUserId);

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

  void getFavoriteHotels()async{
    try {
      List<HotelModel> favoriteList =
          await fireStoreService.getFavoriteHotels(bookedUserId);

      favorite.assignAll(favoriteList);

    } catch (e) {
      print("Error fetching bookings: $e");
    }
  }

  late String bookedUserId;
  String? bookedUserPhoneCode = '+90';
  String bookedCheckInDate = 'August 2,2024';
  String bookedCheckOutDate = 'August 3,2024';
  String bookedCheckInTime = '18:12';
  String bookedCheckOutTime = '18:12';
  String bookedStatusCode='ongoing';
  String? bookedHotelName;
  String? bookedHotelId;
  RxInt bookedAdultSize = 0.obs;
  RxInt bookedChildSize = 0.obs;
  String? paymentMethodName;
  String? paymentMethodIcon;

  @override
  void onInit() {
    super.onInit();
    bookedUserId = auth.activeUserId.value;
    print('new booked user id:$bookedUserId');
    listOfType();
    getFavoriteHotels();
  }

  void incrementAdultCounter() {
    bookedAdultSize++;
  }

  void decrementAdultCounter() {
    if (bookedAdultSize > 0) {
      bookedAdultSize--;
    }
  }

  void incrementChildCounter() {
    bookedChildSize++;
  }

  void decrementChildCounter() {
    if (bookedChildSize > 0) {
      bookedChildSize--;
    }
  }

  String? toConnectPhoneNumber() {
    String connectPhone =
        bookedUserPhoneCode! + TextControllers().reservedPhone.text.toString();
    return connectPhone;
  }

  BookedModel toModel() {
    return BookedModel(
      bookedUserId: bookedUserId,
      bookedUserName: TextControllers().reservedName.text.isNotEmpty
          ? TextControllers().reservedName.text
          : 'Unknown Name',
      bookedUserPhone: toConnectPhoneNumber() ?? 'Unknown Phone',
      bookedCheckInDate: bookedCheckInDate,
      bookedCheckOutDate: bookedCheckOutDate,
      bookedCheckInTime: bookedCheckInTime,
      bookedCheckOutTime: bookedCheckOutTime,
      bookedHotelName: bookedHotelName ?? 'Unknown Hotel',
      bookedAdultSize: bookedAdultSize.toInt(),
      bookedChildSize: bookedChildSize.toInt(),
      bookedStatus: bookedStatusCode,
      bookedHotelId: bookedHotelId??'Unknown Hotel Id',
    );
  }
}
