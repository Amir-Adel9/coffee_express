// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:coffee_express/app_screens/home_screen.dart';
import 'package:coffee_express/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icon.png'),
            Text(
              'Coffee Express',
              style: GoogleFonts.courgette(
                  fontSize: 35, fontWeight: FontWeight.bold, color: mainColor),
            )
          ],
        ),
        splashIconSize: 500,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: secondaryColor,
        duration: 3000,
        animationDuration: Duration(seconds: 1),
        nextScreen: HomeScreen());
  }
}
