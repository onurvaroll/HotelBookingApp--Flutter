import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/server/api/server_controller.dart';
import 'package:hotel/controller/text_controller/text_controller.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../core/color.dart';
import '../../widget/search_page/recent_search_card.dart';
import '../../widget/search_page/search_bar.dart';
import '../../widget/search_page/search_list_hotel_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              TextControllers().searchHotel.clear();
              ServerController.searchList.clear();
            },
            icon: Icon(
              Icons.clear,
              color: ColorConstants.black,
            ),
          ),
        ],
        titleSpacing: 0,
        title: const SearchAppBar(),
      ),
      body: Padding(
        padding: 16.pAll,
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  ServerController.searchList.isEmpty
                      ? "Recent"
                      : 'Search Result (${ServerController.searchList.length})',
                  style: Get.textTheme.headlineMedium!
                      .copyWith(color: ColorConstants.black),
                ),
              ),
              Expanded(
                flex: 8,
                child: ServerController.searchList.isEmpty
                    ? ListView.builder(
                        itemCount: ServerController.recentHist.length,
                        itemBuilder: (context, index) => RecentSearchCard(
                          index: index,
                        ),
                      )
                    : ListView.builder(
                        itemCount: ServerController.searchList.length,
                        itemBuilder: (context, index) {
                          return SearchListHotelCard(
                            hotelModel: ServerController.searchList[index],
                          );
                        },
                      ),
              ),
            ],
          );
        }),
      ),
    );
  }
}


