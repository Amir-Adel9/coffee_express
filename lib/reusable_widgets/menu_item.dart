import 'package:coffee_express/cart_controller.dart';
import 'package:coffee_express/coffee_data_model.dart';
import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final cartController = Get.put(CartController());

Widget menuItem({required Coffee item}) {
  return Container(
    decoration: BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadiusDirectional.circular(12.6),
    ),
    width: 135,
    height: 230,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(15),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              children: [
                Image.asset(
                  item.imagePath,
                  fit: BoxFit.fill,
                  width: 111,
                  height: 111,
                ),
                Container(
                  width: 43,
                  height: 20,
                  decoration: BoxDecoration(
                      color: const Color(0xFF414141).withOpacity(0.8),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(15),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star_outlined,
                        color: Color(0xFFD3A601),
                        size: 18,
                      ),
                      Text(
                        '${item.itemRating}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Text(
            item.itemName,
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontFamily: mainFont),
          ),
          const Spacer(),
          Container(
            width: 111,
            height: 39,
            decoration: BoxDecoration(
                color: const Color(0xFF463d46),
                borderRadius: BorderRadiusDirectional.circular(12)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    '\$${item.itemPrice}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: secondaryFont),
                  ),
                ),
                const Spacer(),
                Container(
                    width: 40,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    child: IconButton(
                        onPressed: () {
                          cartController.addProduct(item);
                        },
                        icon: const Icon(Icons.add)))
              ],
            ),
          )
        ],
      ),
    ),
  );
}
