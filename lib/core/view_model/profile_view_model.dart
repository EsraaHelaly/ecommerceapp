import 'package:ecommerceapp/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/helper/local_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalStorage localStorage = Get.find();

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  UserModel _userModel;
  UserModel get userModel => _userModel;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorage.deleteUser();
  }

  void getUser() async {
    _loading.value = true;

    await localStorage.getUserData.then((value) => _userModel = value);
    _loading.value = false;
    update();
  }
}
