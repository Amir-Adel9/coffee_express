// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:coffee_express/app_screens/home_screen.dart';
import 'package:coffee_express/global_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Stack(
          children: [
            Image.asset(
              'assets/images/bg.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/icon.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'COFFEE ',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: secondaryFont)),
                      TextSpan(
                          text: 'EXPRESS',
                          style: TextStyle(
                              color: Color(0xFFb98068),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: secondaryFont))
                    ]))
                  ],
                ))
          ],
        ),
        backgroundColor: secondaryColor,
        splashIconSize: 2000,
        splashTransition: SplashTransition.fadeTransition,
        duration: 3000,
        animationDuration: Duration(seconds: 1),
        nextScreen: HomeScreen());
  }
}
