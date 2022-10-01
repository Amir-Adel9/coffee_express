import 'package:get/get.dart';
import 'coffee_data_model.dart';

class FavoriteController extends GetxController {
  var _favorites = {}.obs;

  void toggleFavorite(Coffee product) {
    if (_favorites.containsKey(product)) {
      _favorites.removeWhere((key, value) => key == product);
      Get.snackbar('You have removed', '${product.itemName} to your favs');
    } else {
      _favorites[product] = 1;
      Get.snackbar('You have added', '${product.itemName} to your favs');
    }
  }
  get favourites => _favorites;
}
