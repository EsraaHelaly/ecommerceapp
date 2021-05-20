import 'package:ecommerceapp/helper/extention_hexa_color.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String id, name, image, desc, price, size;
  Color color;

  ProductModel(
      {this.name,
      this.image,
      this.desc,
      this.price,
      this.color,
      this.size,
      this.id});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    id = map['id'];

    image = map['image'];
    desc = map['desc'];
    price = map['price'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
  }

  toJston() {
    return {
      'name': name,
      'id': id,
      'image': image,
      'desc': desc,
      'price': price,
      'color': color,
      'size': size,
    };
  }
}
