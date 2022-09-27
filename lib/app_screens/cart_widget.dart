import 'package:coffee_express/cart_controller.dart';
import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:coffee_express/reusable_widgets/cart_item.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../coffee_data_model.dart';
import '../reusable_widgets/menu_item.dart';

final CartController controller = Get.find();
bool isEmpty = false;

Widget cart() {
  if (controller.products.keys.toList().length == 0) {
    return Center(
      child: Column(
        children: [
          Text(
            'Cart',
            style: TextStyle(
                fontSize: 24, fontFamily: mainFont, color: Colors.white),
          ),
          Text(
            'No items currently in cart',
            style: TextStyle(
                fontSize: 24, fontFamily: mainFont, color: Colors.white),
          ),
        ],
      ),
    );
  } else {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 46, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Cart',
              style: TextStyle(
                  fontSize: 24, fontFamily: mainFont, color: Colors.white),
            ),
            Obx(
              () => SizedBox(
                height: 350,
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: isEmpty
                        ? empty()
                        : cartItem(
                            controller: controller,
                            item: controller.products.keys.toList()[index],
                            quantity:
                                controller.products.values.toList()[index],
                            index: index),
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
                      fontSize: 14, fontFamily: mainFont, color: Colors.white),
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
                      fontSize: 14, fontFamily: mainFont, color: Colors.white),
                ),
                Text(
                  '\$30.17',
                  style: TextStyle(
                      fontFamily: secondaryFont,
                      fontSize: 14,
                      color: Colors.white),
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
                      fontSize: 16, fontFamily: mainFont, color: Colors.white),
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
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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

Widget empty() {
  return Center(
    child: Column(
      children: [
        Text(
          'Cart',
          style: TextStyle(
              fontSize: 24, fontFamily: mainFont, color: Colors.white),
        ),
        Text(
          'No items currently in cart',
          style: TextStyle(
              fontSize: 24, fontFamily: mainFont, color: Colors.white),
        ),
      ],
    ),
  );
}
