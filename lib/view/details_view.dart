import 'package:ecommerceapp/constants.dart';
import 'package:ecommerceapp/model/product_model.dart';
import 'package:ecommerceapp/view/widgets/custom_button.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/core/view_model/cart_view_model.dart';
import 'package:ecommerceapp/model/cart_product_model.dart';

class DetailsView extends StatelessWidget {
  final ProductModel model;

  DetailsView({this.model});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Image.network(
                  model.image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CustomText(
                          text: model.name,
                          fontsize: 30,
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(11),
                              width: MediaQuery.of(context).size.width * .40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: Colors.grey.shade300)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(text: 'Size', fontsize: 22),
                                  CustomText(text: model.size, fontsize: 22),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(11),
                              width: MediaQuery.of(context).size.width * .40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: Colors.grey.shade300)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(text: 'Color', fontsize: 22),
                                  Container(
                                    width: 30,
                                    height: 20,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: model.color,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        CustomText(
                          text: 'Details',
                          fontsize: 20,
                        ),
                        SizedBox(height: 15),
                        CustomText(
                          text: model.desc,
                          fontsize: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CustomText(
                            text: 'Price',
                            fontsize: 25,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 5),
                          CustomText(
                            text: '\$${model.price} ',
                            color: kprimaryColor,
                            fontsize: 20,
                          ),
                        ],
                      ),
                      GetBuilder<CartViewModel>(
                        init: Get.find(),
                        builder: (controller) => Container(
                          width: 150,
                          height: 150,
                          padding: EdgeInsets.all(15),
                          child: CustomButton(
                            press: () {
                              controller.addProduct(CartProductModel(
                                name: model.name,
                                image: model.image,
                                price: model.price,
                                quantity: 1,
                                id: model.id,
                              ));
                              print('added');
                            },
                            text: 'Add',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
