import 'package:ecommerceapp/helper/enums.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeliveryTimeView extends StatefulWidget {
  @override
  _DeliveryTimeViewState createState() => _DeliveryTimeViewState();
}

class _DeliveryTimeViewState extends State<DeliveryTimeView> {
  Delivery delivery = Delivery.StanderdDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        RadioListTile<Delivery>(
          value: Delivery.StanderdDelivery,
          groupValue: delivery,
          onChanged: (Delivery value) {
            setState(() {
              delivery = value;
            });
          },
          title: CustomText(
            text: "StanderdDelivery",
            fontsize: 24,
          ),
          subtitle: CustomText(
            text: "\n order will be delivered in 3-5 days",
            fontsize: 18,
          ),
        ),
        SizedBox(height: 10),
        RadioListTile<Delivery>(
          value: Delivery.NextDayDelivery,
          groupValue: delivery,
          onChanged: (Delivery value) {
            setState(() {
              delivery = value;
            });
          },
          title: CustomText(
            text: "NextDayDelivery",
            fontsize: 24,
          ),
          subtitle: CustomText(
            text: "\n order will be delivered in 3-5 days",
            fontsize: 18,
          ),
        ),
        SizedBox(height: 10),
        RadioListTile<Delivery>(
          value: Delivery.NominatedDelivery,
          groupValue: delivery,
          onChanged: (Delivery value) {
            setState(() {
              delivery = value;
            });
          },
          title: CustomText(
            text: "NominatedDelivery",
            fontsize: 24,
          ),
          subtitle: CustomText(
            text: "\n order will be delivered in 3-5 days",
            fontsize: 18,
          ),
        ),
      ]),
    );
  }
}
