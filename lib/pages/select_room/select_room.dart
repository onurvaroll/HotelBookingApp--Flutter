import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/pages/reservation_info/reservation_info.dart';
import '../../controller/room_controller/room_controller.dart';
import '../../core/color.dart';
import '../../widget/button_bottom_sheet/button_bottom_sheet.dart';
import '../../widget/select_hotel/room_card_grid/room_card_grid.dart';
import '../../widget/select_hotel/room_card_list/room_card_list.dart';

class SelectRoom extends StatefulWidget {
  const SelectRoom({super.key});

  @override
  State<SelectRoom> createState() => _SelectRoomState();
}

class _SelectRoomState extends State<SelectRoom> {
  final roomController = Get.put(RoomController());

  bool isList = true;
  int selectedIndex = 0;

  void listOrGrid(bool bool) {
    if (isList != bool) {
      isList = !isList;
      setState(() {});
    }
  }

  void updateSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: ButtonBottomSheet(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ReservationInfo(),
              ));
        },
        buttonName: 'Continue',
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.black),
        title: Text('Select Room',
            textAlign: TextAlign.right,
            style: Get.textTheme.bodySmall!.copyWith(
                color: ColorConstants.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 0)),
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
        return Column(
          children: [
            Expanded(
              child: isList
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: roomController.rooms.length,
                      padding: 16.pH,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            updateSelectedIndex(index);
                          },
                          child: RoomListCard(
                            roomModel: roomController.rooms[index],
                            isSelected: index == selectedIndex,
                          ),
                        );
                      },
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              crossAxisCount: 2),
                      itemCount: roomController.rooms.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          updateSelectedIndex(index);
                        },
                        child: RoomGridCard(
                          roomModel: roomController.rooms[index],
                          isSelected: index == selectedIndex,
                        ),
                      ),
                    ),
            ),
            12.yh
          ],
        );
      }),
    );
  }
}

