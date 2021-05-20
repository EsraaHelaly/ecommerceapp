import 'package:ecommerceapp/core/view_model/cart_view_model.dart';
import 'package:ecommerceapp/core/view_model/checkout_view_model.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 40),
            Container(
              height: 350,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                  itemCount: controller.cartProModel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * .4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.shade100,
                            ),
                            child: Container(
                              height: 180,
                              width: 150,
                              child: Image.network(
                                controller.cartProModel[index].image,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                              text: controller.cartProModel[index].name,
                              style: TextStyle(color: Colors.black),
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 10),
                          CustomText(
                            text: controller.cartProModel[index].price
                                    .toString() +
                                '\$ ',
                            fontsize: 20,
                            alignment: Alignment.bottomLeft,
                            color: kprimaryColor,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'shipping address',
                fontsize: 25,
              ),
            ),
            GetBuilder<CheckOutViewModel>(
              init: CheckOutViewModel(),
              builder: (controller) => CustomText(
                text:
                    '${controller.street1 + ',' + controller.street2 + ',' + controller.state + ',' + controller.city + ',' + controller.country}',
                fontsize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
