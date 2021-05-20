class CategoryModel {
  String name, image;

  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
  }

  toJston() {
    return {
      'name': name,
      'image': image,
    };
  }
}
