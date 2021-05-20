import 'dart:convert';

import 'package:ecommerceapp/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxController {
  setUser(UserModel model) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('user', json.encode(model.toJson()));
  }

  _getUserData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var value = _prefs.getString('user');
    return UserModel.fromJson(json.decode(value));
  }

  Future<UserModel> get getUserData async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void deleteUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    await _prefs.clear();
  }
}
