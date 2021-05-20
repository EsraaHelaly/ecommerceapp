import 'package:ecommerceapp/constants.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/core/view_model/cart_view_model.dart';
import 'checkout/checkout.dart';
import 'widgets/custom_button.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<CartViewModel>(
      init: Get.find(),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: controller.cartProModel.length == 0
            ? Center(
                child: SvgPicture.asset(
                  'images/emptycart.svg',
                  width: 200,
                  height: 200,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                              height: 140,
                              child: Row(
                                children: [
                                  Container(
                                    width: 140,
                                    child: Image.network(
                                      controller.cartProModel[index].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: controller
                                              .cartProModel[index].name,
                                          fontsize: 22,
                                        ),
                                        SizedBox(height: 10),
                                        CustomText(
                                          text:
                                              "\$${controller.cartProModel[index].price.toString()}",
                                          color: kprimaryColor,
                                          fontsize: 20,
                                        ),
                                        SizedBox(height: 20),
                                        Container(
                                          width: 140,
                                          height: 35,
                                          color: Colors.grey.shade200,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .increaseQuantity(index);
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              CustomText(
                                                text: controller
                                                    .cartProModel[index]
                                                    .quantity
                                                    .toString(),
                                                alignment: Alignment.center,
                                                fontsize: 20,
                                                color: Colors.black,
                                              ),
                                              SizedBox(width: 20),
                                              GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .decreaseQuantity(index);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Icon(
                                                    Icons.minimize_sharp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: controller.cartProModel.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 15,
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CustomText(
                                text: 'TOTAL',
                                fontsize: 22,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 15),
                              GetBuilder<CartViewModel>(
                                init: Get.find(),
                                builder: (controller) => CustomText(
                                  text: '\$${controller.totalPrice}',
                                  fontsize: 22,
                                  color: kprimaryColor,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            width: 180,
                            height: 100,
                            child: CustomButton(
                              press: () {
                                Get.to(CheckOutView());
                              },
                              text: 'CHECKOUT',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    ));
  }
}
