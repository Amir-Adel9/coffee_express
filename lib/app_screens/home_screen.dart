// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_express/app_screens/cart_screen_content.dart';
import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/app_screens/home_screen_content.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> body = [home(), cart(), Icon(Icons.favorite)];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainColor,
      body: Center(child: body[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: mainColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: secondaryColor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: secondaryColor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: secondaryColor,
                ),
                label: ''),
          ],
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              })),
    );
  }
}
