// ignore_for_file: prefer_const_constructors

import 'package:coffee_express/app_screens/cart_widget.dart';
import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:coffee_express/global_helpers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../cart_controller.dart';
import '../coffee_data_model.dart';
import '../favorites_controller.dart';
import '../home_screen.dart';

class ProductScreen extends StatefulWidget {
  Coffee item;
  String coffeeType;

  ProductScreen({required this.item, required this.coffeeType});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final cartController = Get.put(CartController());
  final favController = Get.put(FavoriteController());

  int _selectedIndex = 0;
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    if (favController.favourites.containsKey(widget.item)) {
      isFavorite = true;
    } else {
      isFavorite = false;
    }

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
                        widget.item.imagePath,
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
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen())),
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
                    widget.item.itemName,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: mainFont),
                  ),
                  Row(
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
                        ' ${widget.item.itemRating}',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: mainFont,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  RatingBar.builder(
                      itemSize: 20,
                      initialRating: widget.item.itemRating,
                      allowHalfRating: true,
                      glowColor: secondaryColor,
                      glowRadius: 5,
                      itemBuilder: (context, index) =>
                          Icon(Icons.star_outlined, color: Color(0xFFD3A601)),
                      onRatingUpdate: (rating) => setState(() {
                            this.rating = rating;
                            widget.item.itemRating = rating;
                          })),
                ],
              ),
            ),
            Text(
              widget.item.itemDescription,
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
                        '\$${widget.item.itemPrice}',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: secondaryFont,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                    child: FloatingActionButton(
                      splashColor: Colors.transparent,
                      backgroundColor: mainColor,
                      onPressed: () {
                        favController.toggleFavorite(widget.item);
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: isFavorite ? Colors.red : Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cartController.addProduct(widget.item);
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
