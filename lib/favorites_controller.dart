import 'package:get/get.dart';
import 'coffee_data_model.dart';

class FavoriteController extends GetxController {
  var _favorites = {}.obs;

  void toggleFavorite(Coffee product) {
    if (_favorites.containsKey(product)) {
      _favorites.removeWhere((key, value) => key == product);
    } else {
      _favorites[product] = 1;
    }
  }

  void removeProduct(Coffee product) {
    if (_favorites.containsKey(product) && _favorites[product] == 1) {
      _favorites[product] = 1;
    } else {
      _favorites[product] -= 1;
    }
  }
}
