import 'package:ecommerceapp/core/view_model/profile_view_model.dart';
import 'package:ecommerceapp/view/auth/login_screen.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                padding: EdgeInsets.only(top: 80),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                image: DecorationImage(
                                  image: controller.userModel == null
                                      ? AssetImage('images/google.png')
                                      : controller.userModel.pic == 'def'
                                          ? AssetImage('images/google.png')
                                          : NetworkImage(
                                              controller.userModel.pic),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: controller.userModel.name,
                                  fontsize: 25,
                                  color: Colors.black,
                                ),
                                CustomText(
                                  text: controller.userModel.email,
                                  fontsize: 25,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 100),
                      BuildListTile(
                          text: 'Edit Profile', press: () {}, icon: Icons.edit),
                      SizedBox(height: 5),
                      BuildListTile(
                        text: 'Shiping Address',
                        press: () {},
                        icon: Icons.location_city_outlined,
                      ),
                      SizedBox(height: 5),
                      BuildListTile(
                        text: 'Order History',
                        press: () {},
                        icon: Icons.history,
                      ),
                      SizedBox(height: 5),
                      BuildListTile(
                          text: 'Cards',
                          press: () {},
                          icon: Icons.cake_outlined),
                      SizedBox(height: 5),
                      BuildListTile(
                        text: 'Notifications',
                        press: () {},
                        icon: Icons.notification_important,
                      ),
                      SizedBox(height: 5),
                      BuildListTile(
                        text: 'SignOut',
                        press: () {
                          controller.signOut();
                          Get.offAll(LoginScreen());
                        },
                        icon: Icons.login_outlined,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class BuildListTile extends StatelessWidget {
  final String text;
  final Function press;
  final IconData icon;

  const BuildListTile({
    Key key,
    this.text,
    this.press,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: press,
        child: ListTile(
          leading: Icon(icon, size: 25, color: Colors.blueGrey),
          title: CustomText(text: text, fontsize: 18),
          trailing: Icon(
            Icons.navigate_next,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
