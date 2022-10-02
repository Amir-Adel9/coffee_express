import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../coffee_data_model.dart';

class CoffeeTypeController extends GetxController {
  var _coffeeType = {}.obs;

  void changeCoffeeType(String coffeeType) {
    _coffeeType[coffeeType] = coffeeType;
    Get.snackbar('$coffeeType', 'has been selected as your coffee type');
  }

  get coffeeType => _coffeeType;
}
