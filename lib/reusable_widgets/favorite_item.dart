import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatefulWidget {
  const FavoriteItem({super.key});

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 570,
        width: 365,
        decoration: BoxDecoration(
            color: boxColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 25, left: 20, right: 20, bottom: 30),
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: Image.asset(
                  'assets/images/products/hazelnut.jpg',
                  fit: BoxFit.fill,
                  width: 400,
                  height: 300,
                ),
              ),
            ),
            Text('Cinnamon & Cocoa',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: mainFont,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('\$50',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: secondaryFont,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      minimumSize: MaterialStateProperty.all(Size(310, 45)),
                      backgroundColor:
                          MaterialStateProperty.all(secondaryColor)),
                  child: Text(
                    'BUY NOW',
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 16,
                        fontFamily: secondaryFont,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ));
  }
}
