class CartProductModel {
  String id, name, image, price;
  int quantity;

  CartProductModel({
    this.name,
    this.id,
    this.image,
    this.price,
    this.quantity,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    id = map['id'];
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
  }

  toJston() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'id': id,
    };
  }
}
