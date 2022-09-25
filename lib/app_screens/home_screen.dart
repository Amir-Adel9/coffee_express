// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_express/coffee_data_model.dart';
import 'package:coffee_express/global_colors.dart';
import 'package:coffee_express/global_fonts.dart';
import 'package:coffee_express/reusable_widgets/cart_item.dart';
import 'package:coffee_express/reusable_widgets/menu_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String coffeeType ='';
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 21,top: 62,bottom: 13),
            child: Text('Menu',style: TextStyle(color: secondaryColor,fontSize: 48,fontFamily: mainFont),),
          ),
          Center(
            child: Container(
              width: 343,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFF171017),
                borderRadius: BorderRadiusDirectional.circular(10)
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search,color: Colors.grey,),
                  hintText: 'Browse your favourite coffee...',hintStyle: TextStyle(color: Colors.grey,fontSize: 14,)
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: 440,
                width: 38,
                decoration: BoxDecoration(
                  color: Color(0xFF382329),
                  borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(40))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
              RotatedBox(quarterTurns: 3,
                child: TextButton(onPressed: null, child: Text('Cappuccino',style: TextStyle(color: secondaryColor,fontFamily: mainFont),),),
              ),
                    RotatedBox(quarterTurns: 3,
                      child: TextButton(onPressed: null, child: Text('Latte',style: TextStyle(fontFamily: mainFont,color: Color(0xFF705f5b)),),),
                    ),
                    RotatedBox(quarterTurns: 3,
                      child: TextButton(onPressed: null, child: Text('Americano',style: TextStyle(fontFamily: mainFont,color: Color(0xFF705f5b)),),),
                    ),
                    RotatedBox(quarterTurns: 3,
                      child: TextButton(onPressed: null, child: Text('Espresso',style: TextStyle(fontFamily: mainFont,color: Color(0xFF705f5b)),),),
                    ),
                    RotatedBox(quarterTurns: 3,
                      child: TextButton(onPressed: null, child: Text('Flat White',style: TextStyle(fontFamily: mainFont,color: Color(0xFF705f5b)),),),
                    )
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right:45),
                 child:
                Container(
                  width: 280,
                  height: 440,
                  child:
                    Flexible(
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisExtent: 215,
                          mainAxisSpacing: 20
                      ),
                          itemCount: Coffee.items.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index) => SizedBox(
                              width: 135,
                              height: 230,
                              child: menuItem(item: Coffee.items[index]))),
                    )
                ),
              )
            ],
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(backgroundColor: mainColor,
      items: [BottomNavigationBarItem( icon: Icon(Icons.home,color: secondaryColor,), label: ''),
        BottomNavigationBarItem( icon: Icon(Icons.shopping_cart, color: secondaryColor,), label: ''),
        BottomNavigationBarItem( icon: Icon(Icons.favorite, color: secondaryColor,), label: ''),
      ]
      ),
    );
  }
}
