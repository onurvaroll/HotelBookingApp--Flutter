import 'package:get/get.dart';
import '../../model/room_model.dart';

class RoomController extends GetxController {
  var rooms = <RoomModel>[].obs;
  @override
  void onInit() {
    fetchRooms();
    super.onInit();
  }

  void fetchRooms() {
    var roomList = [
      RoomModel(
        name: "Single Room",
        photoUrl: "assets/images/room1.jpg",
        available: "Available for 1 people",
        starRating: "4.2",
        perDay: "\$50",
      ),
      RoomModel(
        name: "Double Room",
        photoUrl: "assets/images/room2.jpg",
        available: "Available for 2 people",
        starRating: "4.5",
        perDay: "\$70",
      ),
      RoomModel(
        name: "Triple Room",
        photoUrl: "assets/images/room1.jpg",
        available: "Available for 3 people",
        starRating: "4.0",
        perDay: "\$90",
      ),
      RoomModel(
        name: "King Room",
        photoUrl: "assets/images/room2.jpg",
        available: "Multiperson room",
        starRating: "4.8",
        perDay: "\$120",
      ),
      RoomModel(
        name: "Queen Room",
        photoUrl: "assets/images/room1.jpg",
        available: "Multiperson room",
        starRating: "4.7",
        perDay: "\$110",
      ),
      RoomModel(
        name: "Twin Room",
        photoUrl: "assets/images/room2.jpg",
        available: "Available for 2 people",
        starRating: "4.3",
        perDay: "\$65",
      ),
      RoomModel(
        name: "Suite Room",
        photoUrl: "assets/images/room1.jpg",
        available: "Available for 4 people",
        starRating: "4.9",
        perDay: "\$200",
      ),
      RoomModel(
        name: "Deluxe Room",
        photoUrl: "assets/images/room2.jpg",
        available: "Available for 4 people",
        starRating: "5.0",
        perDay: "\$250",
      ),
    ];
    rooms.assignAll(roomList);

  }
}