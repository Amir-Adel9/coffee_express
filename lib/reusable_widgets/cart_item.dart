// ignore_for_file: prefer_const_constructors

import 'package:coffee_express/getx_controllers/cart_controller.dart';
import 'package:coffee_express/global_helpers/global_colors.dart';
import 'package:coffee_express/global_helpers/global_fonts.dart';
import 'package:flutter/material.dart';

import '../coffee_data_model.dart';

class CartItem extends StatefulWidget {
  CartController controller;
  Coffee item;
  String coffeeType;
  int quantity;

  CartItem(
      {required this.controller,
      required this.item,
      required this.coffeeType,
      required this.quantity});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  double _removeButtonWidth = 30;
  double _addButtonWidth = 30;

  var _removeButtonColor = secondaryColor;
  var _addButtonColor = secondaryColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 96,
      decoration: BoxDecoration(
          color: boxColor, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                widget.item.imagePath,
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
                  Text(widget.coffeeType,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: mainFont,
                          color: Colors.white)),
                  Text(widget.item.itemName,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: mainFont,
                          color: Colors.white)),
                  Text('\$${widget.item.itemPrice}',
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
                  AnimatedContainer(
                      width: _removeButtonWidth,
                      height: _removeButtonWidth,
                      duration: Duration(milliseconds: 200),
                      onEnd: () {
                        setState(() {
                          _removeButtonWidth = 30;
                          _removeButtonColor = secondaryColor;
                        });
                      },
                      decoration: BoxDecoration(
                          color: _removeButtonColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            widget.controller.removeProduct(widget.item);
                            setState(() {
                              _removeButtonWidth = 28;
                              _removeButtonColor =
                                  secondaryColor.withOpacity(0.8);
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            color: mainColor,
                          ))),
                  Text(
                    '${widget.quantity}',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: mainFont,
                        color: Colors.white),
                  ),
                  AnimatedContainer(
                      width: _addButtonWidth,
                      height: _addButtonWidth,
                      duration: Duration(milliseconds: 200),
                      onEnd: () {
                        setState(() {
                          _addButtonWidth = 30;
                          _addButtonColor = secondaryColor;
                        });
                      },
                      decoration: BoxDecoration(
                          color: _addButtonColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            widget.controller.addProduct(widget.item);
                            setState(() {
                              _addButtonWidth = 28;
                              _addButtonColor = secondaryColor.withOpacity(0.8);
                            });
                          },
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
}
