import 'package:coffee_express/app_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coffee_express/splash_screen/splash_screen.dart';

void main(List<String> args) {
  runApp(const CoffeeExpress());
}

class CoffeeExpress extends StatelessWidget {
  const CoffeeExpress({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
