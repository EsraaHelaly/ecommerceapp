import 'package:ecommerceapp/core/services/home_service.dart';
import 'package:ecommerceapp/model/category_model.dart';
import 'package:ecommerceapp/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  HomeViewModel() {
    getCategory();
    getBestProduct();
  }

  Future getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));

        _loading.value = false;
      }
      update();
    });
  }

  Future getBestProduct() async {
    _loading.value = true;
    HomeService().getBestProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()));

        _loading.value = false;
      }
      update();
    });
  }
}
