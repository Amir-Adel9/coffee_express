import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:coffee_express/reusable_widgets/cart_item.dart';
import 'package:flutter/material.dart';
import '../coffee_data_model.dart';
import '../reusable_widgets/menu_item.dart';

Widget cart() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 46),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Cart',
            style: TextStyle(
                fontSize: 24, fontFamily: mainFont, color: Colors.white),
          ),
          cartItem()
        ],
      ),
    ),
  );
}
