// ignore_for_file: prefer_const_constructors

import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:flutter/material.dart';
import '../coffee_data_model.dart';
import '../reusable_widgets/menu_item.dart';

Widget home() {
  String coffeeType = '';
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 21, top: 62, bottom: 13),
        child: Text(
          'Menu',
          style: TextStyle(
              color: secondaryColor, fontSize: 48, fontFamily: mainFont),
        ),
      ),
      Center(
        child: Container(
          width: 343,
          height: 40,
          decoration: BoxDecoration(
              color: const Color(0xFF171017),
              borderRadius: BorderRadiusDirectional.circular(10)),
          child: const TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(6),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: 'Browse your favourite coffee...',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                )),
          ),
        ),
      ),
      Spacer(),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 418,
            width: 38,
            decoration: const BoxDecoration(
                color: Color(0xFF382329),
                borderRadius:
                    BorderRadiusDirectional.only(topEnd: Radius.circular(40))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                RotatedBox(
                  quarterTurns: 3,
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Cappuccino',
                      style: TextStyle(
                          color: secondaryColor, fontFamily: mainFont),
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Latte',
                      style: TextStyle(
                          fontFamily: mainFont,
                          color: const Color(0xFF705f5b),
                          fontSize: 14),
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Americano',
                      style: TextStyle(
                          fontFamily: mainFont, color: const Color(0xFF705f5b)),
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Espresso',
                      style: TextStyle(
                          fontFamily: mainFont, color: const Color(0xFF705f5b)),
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Flat White',
                      style: TextStyle(
                          fontFamily: mainFont, color: const Color(0xFF705f5b)),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 45),
            child: SizedBox(
                width: 280,
                height: 440,
                child: Flexible(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisExtent: 215,
                              mainAxisSpacing: 20),
                      itemCount: Coffee.items.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => SizedBox(
                          width: 135,
                          height: 230,
                          child: menuItem(item: Coffee.items[index]))),
                )),
          )
        ],
      ),
    ],
  );
}
