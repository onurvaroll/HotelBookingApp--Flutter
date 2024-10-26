import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/core/color.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../controller/booked_controller/booked_controller.dart';
import '../../service/firestore_service.dart';
import '../../widget/favorite_hotel_page/favorite_hotel_grid_card.dart';
import '../../widget/favorite_hotel_page/favorite_hotel_list_card.dart';

class FavoriteHotelPage extends StatefulWidget {
  const FavoriteHotelPage({super.key});

  @override
  State<FavoriteHotelPage> createState() => _FavoriteHotelPageState();
}

class _FavoriteHotelPageState extends State<FavoriteHotelPage> {
  bool isList = true;

  void listOrGrid(bool bool) {
    if (isList != bool) {
      isList = !isList;
      setState(() {});
    }
  }

  final bookedController = Get.put(BookedController());
  final fireStoreService = Get.find<FireStoreService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorite Hotel',
            style: Get.textTheme.bodySmall!.copyWith(
                color: ColorConstants.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 0),
          ),
          iconTheme: IconThemeData(color: ColorConstants.black),
          actions: [
            IconButton(
                onPressed: () {
                  listOrGrid(true);
                },
                icon: Icon(
                  isList ? Icons.description : Icons.description_outlined,
                  color: ColorConstants.black,
                )),
            IconButton(
                onPressed: () {
                  listOrGrid(false);
                },
                icon: Icon(
                  isList ? Icons.grid_view : Icons.grid_view_rounded,
                  color: ColorConstants.black,
                )),
          ],
        ),
        body: Obx(() {
          // bookedController.ongoing observable mı kontrol et
          if (bookedController.favorite.isEmpty) {
            return Center(child: Text('No favorite hotel found.'));
          }

          return isList
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: bookedController.favorite.length,
                  // Burada length kontrolü önemli
                  padding: 16.pH,
                  itemBuilder: (context, index) {
                    return FavoriteHotelListCard(
                      hotelModel: bookedController.favorite[index],
                    );

                    //   RecentlyBookedContainer(
                    //   bookedModel: bookedController.ongoing[index],
                    // );
                  },
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 2),
                  padding: 16.pH,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: bookedController.favorite.length,
                  itemBuilder: (context, index) => FavoriteHotelGridCard(
                    hotelModel: bookedController.favorite[index],
                  ),
                );
        }));
  }
}



