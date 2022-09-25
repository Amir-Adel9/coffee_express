import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:flutter/material.dart';

Widget cartItem() {
  return Container(
    width: 343,
    height: 96,
    decoration:
    BoxDecoration(color: boxColor, borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              'assets/images/products/hazelnut.jpg',
              width: 72,
              height: 72,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cappucino',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: mainFont,
                        color: Colors.white)),
                Text('Blueberry',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: mainFont,
                        color: Colors.white)),
                Text('\$30',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: secondaryFont,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: 87,
            height: 30,
            decoration: BoxDecoration(color: Color(0xFF463d46)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 30,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: null,
                        icon: Icon(
                          Icons.remove,
                          color: mainColor,
                        ))),
                Text(
                  '2',
                  style: TextStyle(
                      fontSize: 20, fontFamily: mainFont, color: Colors.white),
                ),
                Container(
                    width: 30,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: null,
                        icon: Icon(
                          Icons.add,
                          color: mainColor,
                        ))),
              ],
            ),
          )
        ],
      ),
    ),
  );
}