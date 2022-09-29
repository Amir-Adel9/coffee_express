import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/reusable_widgets/cart_item.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_screens/cart_widget.dart';
import 'global_fonts.dart';

class CartTest extends StatefulWidget {
  const CartTest({Key? key}) : super(key: key);

  @override
  State<CartTest> createState() => _CartTestState();
}

class _CartTestState extends State<CartTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: Center(
            child: Icon(
          Icons.abc,
          color: secondaryColor,
        )));
  }
}
