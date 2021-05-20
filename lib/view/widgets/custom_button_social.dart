import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imagePath;
  final Function press;

  const CustomButtonSocial({
    Key key,
    this.text,
    this.imagePath, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: press,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(imagePath),
          SizedBox(width: 60),
          CustomText(
            text: text,
            fontsize: 18,
          ),
        ],
      ),
    );
  }
}
