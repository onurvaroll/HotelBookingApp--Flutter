import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/otel_model.dart';
import '../../service/firestore_service.dart';
import '../../widget/select_hotel/single_details/single_details.dart';

class HotelController extends GetxController {
  var hotels = <List<HotelModel>>[].obs;
  var recommendedHotels = <HotelModel>[].obs;
  var popularHotels = <HotelModel>[].obs;
  var trendingHotels = <HotelModel>[].obs;
  var hotelFacilities = <Widget>[].obs;
  var hotelDetails = <Widget>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHotels();
    hotelDetailing();
  }

  void fetchHotels() async {
    List<HotelModel> hotelList = await FireStoreService().getHotelList();
    recommendedHotels.assignAll(hotelList.sublist(0, 7));
    popularHotels.assignAll(hotelList.sublist(7, 14));
    trendingHotels.assignAll(hotelList.sublist(14, 21));

    hotels.add(recommendedHotels);
    hotels.add(popularHotels);
    hotels.add(trendingHotels);
  }

  void hotelDetailing(){
    var details = [
      const SingleDetails(
        text: 'Hotel',
        icons: Icons.hotel,
      ),
      const SingleDetails(
        text: '4-Bedrooms',
        icons: Icons.bedroom_parent,
      ),
      const SingleDetails(
        text: '2-Bathrooms',
        icons: Icons.bathtub,
      ),
      const SingleDetails(text: '3700 sqft', icons: Icons.aspect_ratio_rounded),
    ];
    var facilities = [
      const SingleDetails(
        text: 'Swimming Pool',
        icons: Icons.pool,
      ),
      const SingleDetails(
        text: 'Wi-Fi',
        icons: Icons.wifi,
      ),
      const SingleDetails(
        text: 'Restaurant',
        icons: Icons.restaurant_menu,
      ),
      const SingleDetails(
        text: 'Parking',
        icons: Icons.local_parking,
      ),
      const SingleDetails(
        text: 'Meeting Room',
        icons: Icons.meeting_room,
      ),
      const SingleDetails(
        text: '24-hours Open',
        icons: Icons.open_in_new,
      ),
    ];
    hotelDetails.assignAll(details);
    hotelFacilities.assignAll(facilities);
  }


  HotelModel getHotelsInfo(String id) {
    for (var hotelList in hotels) {
      for (var hotel in hotelList) {
        if (hotel.id == id) {
          return hotel;
        }
      }
    }
    throw Exception("Hotel with ID $id not found");
  }
}
