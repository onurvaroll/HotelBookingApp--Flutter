import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/model/otel_model.dart';
import 'package:hotel/widget/home_page/room_card.dart';

import '../../controller/hotel_controller/hotel_controller.dart';
import '../../controller/option_controller/option_controller.dart';

class RoomList extends StatefulWidget {
  const RoomList({super.key});

  @override
  State<RoomList> createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  @override
  Widget build(BuildContext context) {
    final HotelController hotelController = Get.find();
    final OptionsController optController = Get.find();

    return Obx(() {
      final selectedIndex = optController.hotelSelectedIndex.value;
      List<HotelModel> listHotel=[];
      if(selectedIndex==0){
        listHotel=hotelController.recommendedHotels;
      }if(selectedIndex==1){
        listHotel= hotelController.popularHotels;
      }if(selectedIndex==2){
        listHotel=hotelController.trendingHotels;
      }
      return SizedBox(
        height: 56.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: 12.pAll,
          itemCount: listHotel.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: 8.pH,
              child: RoomCard(hotelModel: listHotel[index]),
            );
          },
        ),
      );
    }
    );
  }
}
