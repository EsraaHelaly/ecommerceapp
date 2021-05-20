import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hinttext;
  final String text;

  final Function onsaved;
  final Function validator;

  const CustomTextField({
    Key key,
    this.hinttext,
    this.onsaved,
    this.validator,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontsize: 10,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onsaved,
            validator: validator,
            decoration: InputDecoration(
              hintText: hinttext,
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
