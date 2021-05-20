import 'package:ecommerceapp/core/view_model/checkout_view_model.dart';
import 'package:ecommerceapp/helper/enums.dart';
import 'package:ecommerceapp/view/checkout/add_address_view.dart';
import 'package:ecommerceapp/view/checkout/delivery_time_view.dart';
import 'package:ecommerceapp/view/checkout/summary_view.dart';
import 'package:ecommerceapp/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

import '../../constants.dart';

class CheckOutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<CheckOutViewModel>(
          init: Get.find(),
          builder: (controller) => Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  title: Text(
                    "CheckOut",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                backgroundColor: Colors.white,
                body: Column(
                  children: [
                    Container(
                      height: 100,
                      child: StatusChange.tileBuilder(
                        theme: StatusChangeThemeData(
                          direction: Axis.horizontal,
                          connectorTheme:
                              ConnectorThemeData(space: 1.0, thickness: 1.0),
                        ),
                        builder: StatusChangeTileBuilder.connected(
                          itemWidth: (_) =>
                              MediaQuery.of(context).size.width /
                              _processes.length,
                          nameWidgetBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text(
                                _processes[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: controller.getColor(index),
                                ),
                              ),
                            );
                          },
                          indicatorWidgetBuilder: (_, index) {
                            if (index <= controller.index) {
                              return DotIndicator(
                                size: 35.0,
                                border:
                                    Border.all(color: kprimaryColor, width: 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kprimaryColor,
                                  )),
                                ),
                              );
                            } else {
                              return OutlinedDotIndicator(
                                size: 30,
                                borderWidth: 1.0,
                                color: toDoColor,
                              );
                            }
                          },
                          lineWidgetBuilder: (index) {
                            if (index > 0) {
                              if (index == controller.index) {
                                final prevColor =
                                    controller.getColor(index - 1);
                                final color = controller.getColor(index);
                                var gradientColors;
                                gradientColors = [
                                  prevColor,
                                  Color.lerp(prevColor, color, 0.5)
                                ];
                                return DecoratedLineConnector(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: gradientColors,
                                    ),
                                  ),
                                );
                              } else {
                                return SolidLineConnector(
                                  color: controller.getColor(index),
                                );
                              }
                            } else {
                              return null;
                            }
                          },
                          itemCount: _processes.length,
                        ),
                      ),
                    ),
                    controller.pages == Pages.DeliveryTime
                        ? DeliveryTimeView()
                        : controller.pages == Pages.AddAddress
                            ? AddAddressView()
                            : SummaryView(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       controller.index==0?Container(): Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: 200,
                            height: 100,
                            child: CustomButton(
                              text: 'Back',
                              color: Colors.white,
                              textColor: kprimaryColor,
                              press: () {
                                controller.changeIndex(controller.index - 1);
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 200,
                            height: 100,
                            child: CustomButton(
                              text: 'Add',
                              press: () {
                                controller.changeIndex(controller.index + 1);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summer',
];
