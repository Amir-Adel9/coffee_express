// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_express/app_screens/cart_widget.dart';
import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/app_screens/home_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> body = [home(), cart(), Center(child: Icon(Icons.favorite))];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainColor,
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: mainColor,
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
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: secondaryColor,
          unselectedItemColor: secondaryColor.withOpacity(0.4),
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              })),
    );
  }
}
