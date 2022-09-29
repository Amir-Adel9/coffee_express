// ignore_for_file: prefer_const_constructors

import 'package:coffee_express/app_screens/cart_widget.dart';
import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../cart_controller.dart';
import '../coffee_data_model.dart';
import '../favorites_controller.dart';

class ProductScreen extends StatefulWidget {
  Coffee product;
  String coffeeType;

  ProductScreen({required this.product, required this.coffeeType});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final cartController = Get.put(CartController());
  final favController = Get.put(FavoriteController());

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(30)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.product.imagePath,
                        width: 365,
                        height: 335,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 15,
                        left: 10,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: mainColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                widget.coffeeType,
                style: TextStyle(
                    color: Colors.white, fontFamily: mainFont, fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.itemName,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: mainFont),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Icon(
                            Icons.star_outlined,
                            color: Color(0xFFD3A601),
                            size: 15,
                          ),
                        ),
                        Text(
                          ' ${widget.product.itemRating}',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: mainFont,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: FloatingActionButton(
                      backgroundColor: mainColor,
                      onPressed: () =>
                          favController.toggleFavorite(widget.product),
                      child: Icon(Icons.favorite),
                    ),
                  )
                ],
              ),
            ),
            Text(
              widget.product.itemDescription,
              style: TextStyle(
                  fontFamily: secondaryFont, fontSize: 14, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 8),
              child: Text(
                'Choice of Milk',
                style: TextStyle(
                    fontSize: 14, fontFamily: mainFont, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 35,
              width: 500,
              child: ListView.builder(
                  itemCount: Coffee.milkTypes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor: _selectedIndex == index
                                    ? MaterialStateProperty.all(secondaryColor)
                                    : MaterialStateProperty.all(mainColor),
                                minimumSize:
                                    MaterialStateProperty.all(Size(99, 50)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: secondaryColor)))),
                            child: Text(
                              Coffee.milkTypes[index],
                              style: TextStyle(
                                  fontFamily: mainFont,
                                  color: _selectedIndex == index
                                      ? mainColor
                                      : secondaryColor,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: secondaryFont,
                            color: Colors.white),
                      ),
                      Text(
                        '\$${widget.product.itemPrice}',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: secondaryFont,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cartController.addProduct(widget.product);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()));
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                          minimumSize: MaterialStateProperty.all(Size(280, 45)),
                          backgroundColor:
                              MaterialStateProperty.all(secondaryColor)),
                      child: Text(
                        'BUY NOW',
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 16,
                            fontFamily: secondaryFont,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
