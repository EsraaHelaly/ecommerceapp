import 'package:ecommerceapp/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecommerceapp/core/services/firestore_user.dart';
import 'package:ecommerceapp/model/user_model.dart';
import 'package:ecommerceapp/helper/local_storage.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignin = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  final LocalStorage localStorage = Get.find();

  String email, password, name;

  Rx<User> _user = Rx<User>();
  String get user => _user.value?.email;
  @override
  void onInit() {
    super.onInit();
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser.uid);
    }
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSigninMethod() async {
    final GoogleSignInAccount _googleUser = await _googleSignin.signIn();

    GoogleSignInAuthentication _googleSigninAuth =
        await _googleUser.authentication;
    final AuthCredential _credential = GoogleAuthProvider.credential(
      idToken: _googleSigninAuth.idToken,
      accessToken: _googleSigninAuth.accessToken,
    );

    await _auth.signInWithCredential(_credential).then((user) {
      saveUser(user);
      Get.offAll(ControlView());
    });
  }

  void facebookSigninMethod() async {
    FacebookLoginResult _result = await _facebookLogin.logIn(['email']);
    final _accessToken = _result.accessToken.token;

    if (_result.status == FacebookLoginStatus.loggedIn) {
      final AuthCredential _facebookcredential =
          FacebookAuthProvider.credential(_accessToken);

      await _auth.signInWithCredential(_facebookcredential).then((user) {
        saveUser(user);
        Get.offAll(ControlView());
      });
    }
  }

  void signinWithEmailAndPasswrd() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async => getCurrentUserData(value.user.uid));

      Get.offAll(ControlView());
    } catch (e) {
      print(e.message);

      Get.snackbar(
        'error login account',
        e.message,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPasswrd() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        saveUser(user);
      });
      Get.offAll(ControlView());
    } catch (e) {
      print(e.message);

      Get.snackbar(
        'error login account',
        e.message,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user.uid,
      email: user.user.email,
      name: name == null ? user.user.displayName : name,
      pic: "",
    );
    await FirestoreUser().addUserToFirestore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorage.setUser(userModel);
  }

  void getCurrentUserData(String uid) async {
    await FirestoreUser()
        .getCurrentUser(uid)
        .then((value) => setUser(UserModel.fromJson(value.data())));
  }
}
