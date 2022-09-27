import 'package:coffee_express/cart_controller.dart';
import 'package:coffee_express/coffee_data_model.dart';
import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestItem extends StatefulWidget {
  Coffee item;
  TestItem({required this.item});

  @override
  State<TestItem> createState() => _TestItemState();
}

class _TestItemState extends State<TestItem> {
  final cartController = Get.put(CartController());
  double _width = 40;
  var _buttonColor = secondaryColor;
  @override
  Widget build(BuildContext context) {
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
                    widget.item.imagePath,
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
                          '${widget.item.itemRating}',
                          style: const TextStyle(
                            fontFamily: 'Rosarivo',
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Text(
              widget.item.itemName,
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
                      '\$${widget.item.itemPrice}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: secondaryFont),
                    ),
                  ),
                  const Spacer(),
                  AnimatedContainer(
                      width: _width,
                      height: _width,
                      decoration: BoxDecoration(
                          color: _buttonColor,
                          borderRadius: BorderRadiusDirectional.circular(10)),
                      duration: Duration(milliseconds: 200),
                      onEnd: () {
                        setState(() {
                          _width = 40;
                          _buttonColor = secondaryColor;
                        });
                      },
                      child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {
                            cartController.addProduct(widget.item);
                            print(widget.item.coffeeType);
                            setState(() {
                              _width = 37;
                              _buttonColor = secondaryColor.withOpacity(0.6);
                            });
                          },
                          icon: const Icon(Icons.add)))
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}

// Widget menuItem({required Coffee item}) {
//   return 
// }
