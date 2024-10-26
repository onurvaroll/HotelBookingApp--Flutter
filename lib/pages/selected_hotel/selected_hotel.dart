import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/const/const.dart';
import 'package:hotel/controller/hotel_controller/hotel_controller.dart';
import 'package:hotel/core/color.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/model/otel_model.dart';
import 'package:hotel/widget/map/map_kit.dart';
import '../../controller/booked_controller/booked_controller.dart';
import '../../widget/button_bottom_sheet/button_bottom_sheet.dart';
import '../../widget/select_hotel/details_card/details_card.dart';
import '../../widget/select_hotel/scrool_image/scrool_image.dart';
import '../select_date/select_date.dart';

class SelectedHotel extends StatelessWidget {
  SelectedHotel({super.key, required this.selectedHotel});

  final HotelModel selectedHotel;
  final bookedController = Get.put(BookedController());
  final hotelController = Get.find<HotelController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: Get.height * 0.08,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded))
        ],
      ),
      bottomSheet: ButtonBottomSheet(
        onPressed: () {
          bookedController.bookedHotelName = selectedHotel.hotelName;
          bookedController.bookedHotelId = selectedHotel.id;
          print(bookedController.bookedHotelName);
          print(bookedController.bookedHotelId);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SelectDate(),
              ));
        },
        buttonName: 'Book Now',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScrollImage(selectedHotel: selectedHotel),
            Padding(
              padding: 16.pLeft,
              child: Text(
                selectedHotel.hotelName,
                style: Get.textTheme.displaySmall!
                    .copyWith(color: ColorConstants.black),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: 16.pLeft,
              child: Row(
                children: [
                  const Icon(Icons.location_on),
                  Text(
                    selectedHotel.location,
                    style: Get.textTheme.labelMedium!
                        .copyWith(color: ColorConstants.black),
                  )
                ],
              ),
            ),
            Padding(
              padding: 16.pH,
              child: Divider(
                color: ColorConstants.grey,
              ),
            ),
            Padding(
              padding: 16.pH,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gallery Photos',
                    style: Get.textTheme.labelMedium!.copyWith(
                        color: ColorConstants.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: Get.textTheme.labelMedium!.copyWith(
                            color: ColorConstants.black,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            Padding(
              padding: 16.pH,
              child: SizedBox(
                height: 20.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedHotel.detailsPhotos.length,
                  itemBuilder: (context, index) =>
                      Padding(
                        padding: 16.pH,
                        child: Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      selectedHotel.detailsPhotos[index]))),
                        ),
                      ),
                ),
              ),
            ),
            Padding(
              padding: 16.pLeft,
              child: Text(
                'Details',
                style: Get.textTheme.labelMedium!.copyWith(
                    color: ColorConstants.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: 16.pH,
              child: DetailsCard(
                childrenList: hotelController.hotelDetails,
              ),
            ),
            Padding(
              padding: 16.pLeft,
              child: Text(
                'Description',
                style: Get.textTheme.labelMedium!.copyWith(
                    color: ColorConstants.black, fontWeight: FontWeight.bold),
              ),
            ),
            2.yh,
            Padding(
              padding: 16.pH,
              child: Text(
                Const().lorem,
                overflow: TextOverflow.clip,
                style: Get.textTheme.labelSmall!
                    .copyWith(color: ColorConstants.black),
              ),
            ),
            2.yh,
            Padding(
              padding: 16.pLeft,
              child: Text(
                'Facilites',
                textAlign: TextAlign.start,
                style: Get.textTheme.labelMedium!.copyWith(
                    color: ColorConstants.black, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: 16.pH,
              child: DetailsCard(
                childrenList: hotelController.hotelFacilities,
              ),
            ),
            Padding(
              padding: 16.pLeft,
              child: Text(
                'Location',
                textAlign: TextAlign.start,
                style: Get.textTheme.labelMedium!.copyWith(
                    color: ColorConstants.black, fontWeight: FontWeight.bold),
              ),
            ),
            2.yh,
            Padding(
              padding: 16.pH,
              child: CityMapScreen(cityName: selectedHotel.location),
            ),
            16.yh,
          ],
        ),
      ),
    );
  }
}





