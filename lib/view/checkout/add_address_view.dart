import 'package:ecommerceapp/core/view_model/checkout_view_model.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:ecommerceapp/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find(),
      builder: (controller) => Form(
        key: controller.formState,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  CustomText(
                    text: 'Billing address is the same as delivery address',
                    fontsize: 20,
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 40),
                  CustomTextField(
                    text: 'Street1',
                    hinttext: '21 , eltahrir street',
                    onsaved: (value) {
                      controller.street1 = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) return 'you must fill this field';
                    },
                  ),
                  SizedBox(height: 40),
                  CustomTextField(
                    text: 'Street2',
                    hinttext: 'opposite to medan sorour ',
                    onsaved: (value) {
                      controller.street2 = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) return 'you must fill this field';
                    },
                  ),
                  SizedBox(height: 40),
                  CustomTextField(
                    text: 'City',
                    hinttext: 'Damitta ',
                    onsaved: (value) {
                      controller.city = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) return 'you must fill this field';
                    },
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: CustomTextField(
                              text: 'State',
                              hinttext: 'Damitta ',
                              onsaved: (value) {
                                controller.state = value;
                              },
                              validator: (String value) {
                                if (value.isEmpty)
                                  return 'you must fill this field';
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CustomTextField(
                              text: 'Country',
                              hinttext: 'Egypt ',
                              onsaved: (value) {
                                controller.country = value;
                              },
                              validator: (String value) {
                                if (value.isEmpty)
                                  return 'you must fill this field';
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
