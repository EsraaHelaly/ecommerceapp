import 'package:ecommerceapp/core/view_model/auth_view_model.dart';
import 'package:ecommerceapp/core/view_model/checkout_view_model.dart';
import 'package:ecommerceapp/core/view_model/home_view_model.dart';
import 'package:ecommerceapp/core/view_model/nav_bar_home_view_model.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/core/view_model/cart_view_model.dart';
import 'local_storage.dart';
import 'package:ecommerceapp/core/view_model/profile_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => NavBarHomeViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorage());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => CheckOutViewModel());
  }
}
