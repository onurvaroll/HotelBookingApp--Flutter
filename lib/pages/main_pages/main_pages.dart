import 'package:flutter/material.dart';
import 'package:hotel/extentions/extentions.dart';
import '../booking_page/booking_page.dart';
import '../home_page/home_page.dart';
import '../profile_page/profile_page.dart';
import '../search_page/search_page.dart';


class MainPages extends StatefulWidget {
   const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();

}

class _MainPagesState extends State<MainPages> {
  int currentPageIndex = 0;
  void changePage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        HomePage(
            onButtonPressed: () => changePage(2),
        onButtonPressed2: ()=>changePage(1),),
        const SearchPage(),
        const BookingPage(),
         const ProfilePage(),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        shadowColor: Colors.black,
        indicatorColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        height: 8.h,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home_rounded,color: Colors.green,size: 32,),
            icon: Icon(Icons.home_outlined,color: Colors.grey,size: 32),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search_rounded,color: Colors.green,size: 32),
            icon: Icon(Icons.search_outlined,color: Colors.grey,size: 32),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.my_library_books_rounded,color: Colors.green,size: 32),
            icon: Icon(Icons.my_library_books_outlined,color: Colors.grey,size: 32),
            label: 'Booking',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_rounded,color: Colors.green,size: 32),
            icon: Icon(Icons.person_outlined,color: Colors.grey,size: 32),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
