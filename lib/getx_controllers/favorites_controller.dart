import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../coffee_data_model.dart';

class FavoriteController extends GetxController {
  var _favorites = {}.obs;

  void toggleFavorite(Coffee product) {
    if (_favorites.containsKey(product)) {
      _favorites.removeWhere((key, value) => key == product);
      Get.snackbar('${product.itemName}', ' was removed to your favorites',
          icon: Icon(Icons.heart_broken));
    } else {
      _favorites[product] = 1;
      Get.snackbar('${product.itemName}', ' was added to your favorites',
          icon: Icon(Icons.favorite));
    }
  }

  get favourites => _favorites;
}
