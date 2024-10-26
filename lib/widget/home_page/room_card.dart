import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/pages/selected_hotel/selected_hotel.dart';
import 'package:hotel/service/firestore_service.dart';

import '../../core/color.dart';
import '../../model/otel_model.dart';


class RoomCard extends StatefulWidget {
  const RoomCard({super.key, required this.hotelModel});
  final HotelModel hotelModel;

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  final fireStoreService = Get.find<FireStoreService>();
  bool _isLike = false;
  void _likeStatus() {
    if (_isLike) {
      setState(() {
        _isLike = false;
      });
      fireStoreService.removeFavHotel('JFvMF2TILVYx8uEu2YE7TtoglzI3',widget.hotelModel.id);
    } else {
      setState(() {
        _isLike = true;
      });
      fireStoreService.addFavHotel('JFvMF2TILVYx8uEu2YE7TtoglzI3',widget.hotelModel.id);
    }
  }
  likeStatus() async {
    try {
      bool likeStatus = await fireStoreService.favoriteHotelStatus(
        'JFvMF2TILVYx8uEu2YE7TtoglzI3', // userId
        widget.hotelModel.id,           // hotelId
      );

      if (mounted) {
        setState(() {
          _isLike = likeStatus;
        });
      }
    } catch (error) {
      print("Error checking like status: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedHotel(selectedHotel: widget.hotelModel),));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
        ),
        width: 72.w,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                widget.hotelModel.coverPhoto,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Card(
                color: ColorConstants.black,
                child: Padding(
                  padding: 8.pAll,
                  child: Row(
                    children: [
                      Icon(Icons.star, color: ColorConstants.primary),
                      Text(
                        widget.hotelModel.starRating.toString(),
                        style: Get.textTheme.labelMedium!
                            .copyWith(color: ColorConstants.primary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     widget.hotelModel.hotelName,
                      style: Get.textTheme.bodySmall!.copyWith(
                          color: ColorConstants.primary,
                          fontFamily: 'Poppins-Regular',fontWeight: FontWeight.bold),
                    ),
                    1.yh,
                    Text(
                      widget.hotelModel.location,
                      style: Get.textTheme.labelMedium!.copyWith(
                          color: ColorConstants.primary,
                          fontFamily: 'Poppins-ThinItalic'),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "\$${widget.hotelModel.perHour}",
                        style: Get.textTheme.labelLarge!.copyWith(
                            color: ColorConstants.primary,
                            fontFamily: 'Poppins-Regular',
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: " / per hour",
                        style: Get.textTheme.labelMedium!.copyWith(
                          color: ColorConstants.primary,
                          fontFamily: 'Poppins-ThinItalic',
                        ),
                      ),
                    ])),

                  ],
                ),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: IconButton(onPressed: (){
                _likeStatus();
                //FireStoreService().addFavHotel("wgXDjDUcb4SJaexouOL6ClGl4Ji2", widget.hotelModel.id);
              },
                  icon: _isLike? Icon(Icons.bookmark,color: ColorConstants.black):Icon(Icons.bookmark_border,color: ColorConstants.primary,)),
            )
          ],
        ),
      ),
    );
  }
}
