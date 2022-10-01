// ignore_for_file: prefer_const_constructors

import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:coffee_express/reusable_widgets/favorite_item.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          'Favorite Items',
          style: TextStyle(
            color: secondaryColor,
            fontFamily: mainFont,
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 570,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Center(
                child: Dismissible(
              background: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Icon(
                    CupertinoIcons.cart,
                    color: Colors.white,
                  ),
                ),
              ),
              secondaryBackground: Container(
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(
                    CupertinoIcons.trash,
                    color: Colors.white,
                  ),
                ),
              ),
              key: UniqueKey(),
              direction: DismissDirection.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: FavoriteItem(),
              ),
            )),
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
