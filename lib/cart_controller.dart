import 'package:get/get.dart';
import 'coffee_data_model.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  void addProduct(Coffee product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
  }

  void removeProduct(Coffee product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;
  get productSubtotal => _products.entries
      .map((product) => product.key.itemPrice * product.value)
      .toList();
  get taxes => _products.entries
      .map((product) => ((product.key.itemPrice * product.value) * 0.14))
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
  get total => _products.entries
      .map((product) =>
          (product.key.itemPrice * product.value) +
          20 +
          ((product.key.itemPrice * product.value) * 0.14))
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
