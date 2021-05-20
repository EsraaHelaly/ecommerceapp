import 'package:ecommerceapp/core/view_model/auth_view_model.dart';
import 'package:ecommerceapp/view/auth/login_screen.dart';
import 'package:ecommerceapp/view/widgets/custom_button.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:ecommerceapp/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  RegisterScreen({Key key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.off(LoginScreen());
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30.0,
          ),
        ),
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
                    CustomText(text: "Sign UP,"),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(height: 70),
                CustomTextField(
                  text: 'Name',
                  hinttext: 'enter your name',
                  onsaved: (value) {
                    controller.name = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                ),
                SizedBox(height: 30),
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
                SizedBox(height: 60),
                CustomButton(
                  text: 'SIGN UP',
                  press: () {
                    _formkey.currentState.save();
                    if (_formkey.currentState.validate()) {
                      controller.createAccountWithEmailAndPasswrd();
                    }
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
