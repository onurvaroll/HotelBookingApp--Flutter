import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/model/booked_model.dart';
import 'package:hotel/pages/favorite_hotel_page/favorite_hotel_page.dart';
import 'package:hotel/pages/notifications/notifications_page.dart';
import 'package:hotel/pages/selected_hotel/selected_hotel.dart';
import '../../const/const.dart';
import '../../controller/booking_page_controller/booking_page_controller.dart';
import '../../controller/hotel_controller/hotel_controller.dart';
import '../../controller/option_controller/option_controller.dart';
import '../../core/color.dart';
import '../../enums/options_names.dart';
import '../../widget/home_page/name.dart';
import '../../widget/home_page/option_button.dart';
import '../../widget/home_page/room_list.dart';
import '../../widget/home_page/search.dart';

class HomePage extends StatelessWidget {
  HomePage(
      {super.key,
      required this.onButtonPressed,
      required this.onButtonPressed2});

  final VoidCallback onButtonPressed;
  final VoidCallback onButtonPressed2;

  final OptionsController controller = Get.put(OptionsController());
  final Const consts = Const();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: consts.appIcon,
        title: Text(
          consts.appName,
          textAlign: TextAlign.right,
          style: Get.textTheme.bodySmall!.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 0),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsPage(),
                    ));
              },
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoriteHotelPage(),
                    ));
              },
              icon: const Icon(
                Icons.bookmark_border_outlined,
                color: Colors.black,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: 16.pLeft,
              child: const HomePageName(),
            ),
            2.yh,
            Padding(
              padding: 12.pH,
              child: HomePageSearchButton(onTap: onButtonPressed2),
            ),
            //2.yh,
            Center(
              child: SizedBox(
                height: 8.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: 12.pAll,
                  itemCount: OptionNames.values.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: 8.pH,
                      child: HotelsOptionsButton(index: index),
                    );
                  },
                ),
              ),
            ),

            const RoomList(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Recently Booked",
                  style: Get.textTheme.bodySmall!
                      .copyWith(color: ColorConstants.black, letterSpacing: 0),
                ),
                TextButton(
                  onPressed: onButtonPressed,
                  child: Text("See All",
                      style: Get.textTheme.labelMedium!
                          .copyWith(color: Colors.black)),
                ),
              ],
            ),

            RecentlyBookedList(),
          ],
        ),
      ),
    );
  }
}

class RecentlyBookedList extends StatelessWidget {
  RecentlyBookedList({super.key});

  final BookingPageController bookingPageController = Get.find();
  final hotelController = Get.find<HotelController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.pH,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: bookingPageController.ongoing.length > 3
            ? 3
            : bookingPageController.ongoing.length,
        itemBuilder: (context, index) => Padding(
          padding: 8.pV,
          child: RecentlyBookedContainer(
              bookedModel: bookingPageController.ongoing[index]),
        ),
      ),
    );
  }
}

class RecentlyBookedContainer extends StatelessWidget {
  RecentlyBookedContainer({
    super.key,
    required this.bookedModel,
  });

  final BookedModel bookedModel;
  final hotelController = Get.find<HotelController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 4.pV,
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectedHotel(
                  selectedHotel:
                      hotelController.getHotelsInfo(bookedModel.bookedHotelId)),
            )),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              color: ColorConstants.primary,
            ),
            child: Padding(
              padding: 8.pAll,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 12.h,
                        width: 12.h,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              hotelController
                                  .getHotelsInfo(bookedModel.bookedHotelId)
                                  .coverPhoto,
                              fit: BoxFit.cover,
                            )),
                      ),
                      4.xw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              hotelController
                                  .getHotelsInfo(bookedModel.bookedHotelId)
                                  .hotelName,
                              style: Get.textTheme.labelMedium!.copyWith(
                                  color: ColorConstants.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0)),
                          Text(
                              hotelController
                                  .getHotelsInfo(bookedModel.bookedHotelId)
                                  .location,
                              style: Get.textTheme.labelSmall!
                                  .copyWith(color: ColorConstants.darkGrey)),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: ColorConstants.starColor,
                                size: 20,
                              ),
                              Text(
                                hotelController
                                    .getHotelsInfo(bookedModel.bookedHotelId)
                                    .starRating
                                    .toString(),
                                style: Get.textTheme.labelMedium!.copyWith(
                                    color: ColorConstants.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              ),
                              4.yh,
                              const Text(
                                '  (3200 reviews)',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '\$${hotelController.getHotelsInfo(bookedModel.bookedHotelId).perHour.toInt()}',
                        style: Get.textTheme.labelLarge!.copyWith(
                            color: ColorConstants.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "/nigth",
                        style: Get.textTheme.labelSmall!.copyWith(
                            fontSize: 8,
                            color: ColorConstants.black,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.black,
                          ))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
