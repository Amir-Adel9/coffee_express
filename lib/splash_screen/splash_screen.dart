// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:coffee_express/global_helpers/global_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:coffee_express/home.dart';
import 'package:coffee_express/global_helpers/global_colors.dart';
import 'package:flutter/material.dart';

double offSetValue = 10;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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
                      child: AnimatedBuilder(
                        animation: animationController.view,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, animationController.value * 20),
                            child: child,
                          );
                        },
                        child: Image.asset(
                          'assets/images/icon.png',
                          width: 250,
                          height: 200,
                        ),
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
        nextScreen: Home());
  }
}
