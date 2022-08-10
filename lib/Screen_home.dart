import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/Controller/home_controller.dart';

import 'package:shopx/presentaion/screens/Home/home_screen.dart';
import 'package:shopx/presentaion/screens/cart/cart.dart';
import 'package:shopx/presentaion/screens/catagories/catagories_screen.dart';
import 'package:shopx/presentaion/screens/profile/profile_screen.dart';
import 'package:shopx/presentaion/screens/whishlist/whishlist_screen.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  // int currentselectedindex = 0;

  final _pages = [
    HomeScreen(),
    CatagoriesScreen(),
    WhishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: GetBuilder<HomeController>(builder: (controller) {
        return BottomNavigationBar(
          currentIndex: controller.currentSelectedindex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 10, color: Colors.black),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 9,
            color: Colors.white,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'CATEGORIES',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'WISHLIST',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_travel),
              label: 'CART',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              label: 'PROFILE',
            ),
          ],
          onTap: (newindex) {
            homeController.onSelectedItem(newindex);

            //     setState(() {
            //   currentselectedindex = newindex;
            //  });
          },
        );
      }),
      body: GetBuilder<HomeController>(builder: (controller) {
        return _pages[controller.currentSelectedindex];
      }),
      // body: _pages[currentselectedindex],
    );
  }
}
