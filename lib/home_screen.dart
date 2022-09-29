// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_express/app_screens/cart_widget.dart';
import 'package:coffee_express/app_screens/favorites_screen.dart';
import 'package:coffee_express/cart_test.dart';
import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/app_screens/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      HomeWidget(),
      CartScreen(),
      FavoritesScreen(),
      Center(child: Icon(Icons.adb_rounded))
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainColor,
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: mainColor,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                label: ''),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: secondaryColor,
          unselectedItemColor: secondaryColor.withOpacity(0.4),
          selectedIconTheme: IconThemeData(size: 30),
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              })),
    );
  }
}
