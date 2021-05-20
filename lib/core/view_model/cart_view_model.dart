import 'package:ecommerceapp/core/services/database/cart_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/model/cart_product_model.dart';

class CartViewModel extends GetxController {
  var dbHelper = CartDatabaseHelper.db;

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _cartProModel = [];
  List<CartProductModel> get cartProModel => _cartProModel;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  CartViewModel() {
    getAllProduct();
  }
  addProduct(CartProductModel model) async {
    for (var i = 0; i < _cartProModel.length; i++) {
      if (_cartProModel[i].id == model.id) {
        return;
      }
    }

    await dbHelper.insert(model);

    _cartProModel.add(model);
    print(_cartProModel.length);
    _totalPrice += (double.parse(model.price) * model.quantity);

    update();
  }

  getAllProduct() async {
    _loading.value = true;
    _cartProModel = await dbHelper.getAllProduct();

    _loading.value = false;
    print(_cartProModel.length);

    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProModel.length; i++) {
      _totalPrice +=
          (double.parse(_cartProModel[i].price) * _cartProModel[i].quantity);
      update();
    }
  }

  increaseQuantity(int index) async {
    _cartProModel[index].quantity++;
    _totalPrice += (double.parse(_cartProModel[index].price));
    await dbHelper.updateProduct(_cartProModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProModel[index].quantity--;
    _totalPrice -= (double.parse(_cartProModel[index].price));
    await dbHelper.updateProduct(_cartProModel[index]);
    update();
  }
}
