// ignore_for_file: prefer_const_constructors

import 'package:coffee_express/app_screens/product_screen.dart';
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
                SizedBox(
                  height: 418,
                  width: 38,
                  child: ListView.builder(
                      itemCount: Coffee.coffeTypes.length,
                      itemBuilder: (context, index) =>
                          coffeType(coffeeType: Coffee.coffeTypes[index])),
                ),
              ],
            ),
          ),
          Spacer(),
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
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                        product: Coffee.items[index],
                                      ))),
                          child: menuItem(item: Coffee.items[index]))),
                )),
          )
        ],
      ),
    ],
  );
}

Widget coffeType({required String coffeeType}) {
  return RotatedBox(
    quarterTurns: 3,
    child: TextButton(
      onPressed: null,
      child: Text(
        coffeeType,
        style: TextStyle(
            color: secondaryColor.withOpacity(0.4),
            fontFamily: mainFont,
            fontStyle: FontStyle.italic,
            fontSize: 12),
      ),
    ),
  );
}
