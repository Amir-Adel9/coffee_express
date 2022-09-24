// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_express/coffee_data_model.dart';
import 'package:coffee_express/global_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Coffee Express',
            style: TextStyle(color: secondaryColor),
          )),
          Image.asset(Coffee.items[5].imagePath)
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: mainColor,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_cart), label: 'Cart'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite), label: 'Favorites')
      //   ],
      // ),
    );
  }
}
