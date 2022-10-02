// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_express/app_screens/cart_screen.dart';
import 'package:coffee_express/app_screens/favorites_screen.dart';
import 'package:coffee_express/global_helpers/global_colors.dart';
import 'package:coffee_express/app_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx_controllers/cart_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    List<Widget> body = [HomeScreen(), CartScreen(), FavoritesScreen()];
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
                label: '')
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
