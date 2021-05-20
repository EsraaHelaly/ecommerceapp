import 'package:ecommerceapp/core/view_model/auth_view_model.dart';
import 'package:ecommerceapp/core/view_model/nav_bar_home_view_model.dart';
import 'package:ecommerceapp/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<NavBarHomeViewModel>(
              init: NavBarHomeViewModel(),
              builder: (controller) => Scaffold(
                resizeToAvoidBottomInset: false,
                body: controller.currentView,
                bottomNavigationBar: bottomNavBar(),
              ),
            );
    });
  }

  Widget bottomNavBar() {
    return GetBuilder<NavBarHomeViewModel>(
      init: NavBarHomeViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text('Explore'),
            ),
            label: '',
            icon: Icon(Icons.saved_search),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text('Cart'),
            ),
            label: '',
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text('Account'),
            ),
            label: '',
            icon: Icon(Icons.person_outline_rounded),
          ),
        ],
        currentIndex: controller.navValue,
        onTap: (index) => controller.changevalue(index),
        elevation: 0.0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade100,
      ),
    );
  }
}
