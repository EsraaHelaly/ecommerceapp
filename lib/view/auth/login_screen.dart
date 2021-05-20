import 'package:ecommerceapp/constants.dart';
import 'package:ecommerceapp/core/view_model/auth_view_model.dart';
import 'package:ecommerceapp/view/widgets/custom_button.dart';
import 'package:ecommerceapp/view/widgets/custom_button_social.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:ecommerceapp/view/widgets/custom_text_field.dart';
import 'register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  LoginScreen({Key key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Welcome,"),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterScreen());
                      },
                      child: CustomText(
                        text: "Sign Up",
                        fontsize: 20,
                        color: kprimaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomText(
                  text: 'Sign in to continue',
                  fontsize: 14,
                  color: Colors.grey,
                ),
                SizedBox(height: 70),
                CustomTextField(
                  text: 'Email',
                  hinttext: 'enter your email',
                  onsaved: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                ),
                SizedBox(height: 30),
                CustomTextField(
                  text: 'Password',
                  hinttext: 'enter your password',
                  onsaved: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                ),
                SizedBox(height: 30),
                CustomText(
                  text: 'forget password?',
                  fontsize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(height: 40),
                CustomButton(
                  text: 'SIGN IN',
                  press: () {
                    _formkey.currentState.save();
                    if (_formkey.currentState.validate()) {
                      controller.signinWithEmailAndPasswrd();
                    }
                  },
                ),
                SizedBox(height: 20),
                CustomText(
                  text: "-OR-",
                  fontsize: 17,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 30),
                CustomButtonSocial(
                  text: 'Sign In With Facebook',
                  imagePath: 'images/facebook.png',
                  press: () {
                    controller.facebookSigninMethod();
                  },
                ),
                SizedBox(height: 15),
                CustomButtonSocial(
                  text: 'Sign In With Google',
                  imagePath: 'images/google.png',
                  press: () {
                    controller.googleSigninMethod();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
