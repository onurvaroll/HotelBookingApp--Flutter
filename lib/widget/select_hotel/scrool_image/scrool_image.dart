import 'package:flutter/material.dart';

import '../../../core/color.dart';
import '../../../model/otel_model.dart';

class ScrollImage extends StatefulWidget {
  const ScrollImage({super.key, required this.selectedHotel});

  final HotelModel selectedHotel;

  @override
  State<ScrollImage> createState() => _ScrollImageState();
}

class _ScrollImageState extends State<ScrollImage> {
  void _onHorizontalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity! < 0) {
      setState(() {
        if (currentIndex < widget.selectedHotel.detailsPhotos.length - 1) {
          currentIndex++;
        }
      });
    } else if (details.primaryVelocity! > 0) {
      setState(() {
        if (currentIndex > 0) {
          currentIndex--;
        }
      });
    }
  }

  int currentIndex = 0;

  Widget pageRange(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        height: 12,
        width: currentIndex == index ? 36 : 12,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorConstants.green,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.selectedHotel.detailsPhotos[currentIndex],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.selectedHotel.detailsPhotos.length,
                    (index) => pageRange(index, context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}