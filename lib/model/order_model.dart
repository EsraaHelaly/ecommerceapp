class OrderModel {
  String userId, dateTime;
  Address address;

  OrderModel(
    this.userId,
    this.dateTime,
    this.address,
  );

  OrderModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    dateTime = map['dateTime'];
    address = map['address'];
  }

  toJston() {
    return {
      'userId': userId,
      'dateTime': dateTime,
      'address': address,
    };
  }
}

class Address {
  String street1, street2, city, state, country;

  Address(
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.country,
  );

  Address.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    street1 = map['street1'];
    street2 = map['street2'];
    city = map['city'];
    state = map['state'];
    country = map['country'];
  }

  toJston() {
    return {
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'country': country,
    };
  }
}
