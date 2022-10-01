// ignore_for_file: prefer_const_constructors

import 'package:coffee_express/home_screen.dart';
import 'package:coffee_express/app_screens/home_widget.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:coffee_express/cart_controller.dart';
import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:coffee_express/reusable_widgets/cart_item.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../coffee_data_model.dart';
import '../reusable_widgets/menu_item.dart';

final CartController controller = Get.find();
bool isEmpty = false;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    if (controller.products.keys.toList().length == 0) {
      return emptyCart();
    } else {
      return Scaffold(
        backgroundColor: mainColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 46, left: 18, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Cart',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: mainFont,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 115,
                  ),
                  IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen())),
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ))
                ],
              ),
              Obx(
                () => SizedBox(
                  height: 350,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Center(
                        child: Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                CupertinoIcons.trash,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onDismissed: (direction) => setState(() {
                            controller.products.remove(
                                controller.products.keys.toList()[index]);
                          }),
                          child: CartItem(
                            controller: controller,
                            item: controller.products.keys.toList()[index],
                            quantity:
                                controller.products.values.toList()[index],
                          ),
                        ),
                      ),
                    ),
                    itemCount: controller.products.length,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: DottedLine(
                  dashColor: Colors.white.withOpacity(0.6),
                  dashLength: 10,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Charges',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: mainFont,
                        color: Colors.white),
                  ),
                  Text(
                    '\$20',
                    style: TextStyle(
                        fontFamily: secondaryFont,
                        fontSize: 14,
                        color: Colors.white),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Taxes',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: mainFont,
                        color: Colors.white),
                  ),
                  Obx(
                    () => Text(
                      '\$${controller.taxes}',
                      style: TextStyle(
                          fontFamily: secondaryFont,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12, top: 12),
                child: DottedLine(
                  dashColor: Colors.white.withOpacity(0.9),
                  dashLength: 10,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grand Total',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: mainFont,
                        color: Colors.white),
                  ),
                  Obx(() => Text(
                        '\$${controller.total}',
                        style: TextStyle(
                            fontFamily: secondaryFont,
                            fontSize: 20,
                            color: Colors.white),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                      Get.snackbar(
                          'Order Received', 'thank you for your purchase',
                          snackPosition: SnackPosition.TOP,
                          icon: Icon(Icons.coffee_sharp),
                          duration: Duration(seconds: 2));
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(340, 45)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(secondaryColor)),
                    child: Text(
                      'PAY NOW',
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 16,
                          fontFamily: secondaryFont),
                    )),
              )
            ],
          ),
        ),
      );
    }
  }

  Widget emptyCart() {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                'Cart',
                style: TextStyle(
                    fontSize: 24, fontFamily: mainFont, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/icon.png',
                    width: 250,
                    height: 200,
                  ),
                  Text(
                    'No items currently in cart',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: mainFont,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
