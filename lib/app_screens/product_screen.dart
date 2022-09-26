// ignore_for_file: prefer_const_constructors

import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:flutter/material.dart';

import '../coffee_data_model.dart';

class ProductScreen extends StatelessWidget {
  Coffee product;
  ProductScreen({required this.product});

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
                        product.imagePath,
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
                'Cappuccino',
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
                    product.itemName,
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
                          ' ${product.itemRating}',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: mainFont,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              product.itemDescription,
              style: TextStyle(
                  fontFamily: secondaryFont, fontSize: 14, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 8),
              child: Text(
                'Choice of Milk',
                style: TextStyle(
                    fontSize: 14, fontFamily: mainFont, color: Colors.white),
              ),
            ),
            Container(
              color: Colors.red,
              height: 30,
              width: 500,
              child: ListView.builder(
                  itemCount: Coffee.milkTypes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: milkChoice(milkType: Coffee.milkTypes[index]),
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
                        '\$${product.itemPrice}',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: secondaryFont,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                          minimumSize:
                              MaterialStateProperty.all<Size>(Size(250, 45)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(secondaryColor)),
                      child: Text(
                        'BUY NOW',
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 16,
                            fontFamily: secondaryFont),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget milkChoice({required String milkType}) {
    return Container(
      width: 99,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        milkType,
        style: TextStyle(fontFamily: mainFont, color: mainColor, fontSize: 14),
      )),
    );
  }
}
