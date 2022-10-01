import 'package:coffee_express/app_screens/cart_widget.dart';
import 'package:coffee_express/cart_controller.dart';
import 'package:coffee_express/coffee_data_model.dart';
import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:flutter/material.dart';

import '../favorites_controller.dart';

class FavoriteItem extends StatefulWidget {
CartController controller;
Coffee item;

FavoriteItem({
  required this.controller,
  required this.item
});

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 365,
        decoration: BoxDecoration(
            color: boxColor, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 10),
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Image.asset(
                  widget.item.imagePath,
                  fit: BoxFit.fill,
                  width: 90,
                  height: 70,
                ),
              ),
            ),
            Text(widget.item.itemName,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: mainFont,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('\$${widget.item.itemPrice}',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: secondaryFont,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                  onPressed: (){
                    controller.addProduct(widget.item);
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>CartScreen()));
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      minimumSize: MaterialStateProperty.all(Size(20, 20)),
                      backgroundColor:
                          MaterialStateProperty.all(secondaryColor)),
                  child: Text(
                    'BUY NOW',
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 10,
                        fontFamily: secondaryFont,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ));
  }
}
