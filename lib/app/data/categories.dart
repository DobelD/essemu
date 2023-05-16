class CategoriesModel {
  Data? data;

  CategoriesModel({this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Categories>? categories;

  Data({this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? imageUrl;
  List<Menu>? menu;

  Categories({this.id, this.name, this.menu, this.imageUrl});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];

    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu!.add(Menu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;

    if (this.menu != null) {
      data['menu'] = this.menu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menu {
  int? id;
  String? name;
  String? description;
  int? price;
  String? imageUrl;
  bool? favorit;
  MenuCategory? categories;
  Restaurant? restaurant;

  Menu(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.imageUrl,
      this.favorit,
      this.categories,
      this.restaurant});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['image_url'];
    favorit = json['favorit'];
    categories = json['categories'] != null
        ? new MenuCategory.fromJson(json['categories'])
        : null;
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;
    data['favorit'] = this.favorit;
    if (this.categories != null) {
      data['categories'] = this.categories!.toJson();
    }
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant!.toJson();
    }
    return data;
  }
}

class MenuCategory {
  int? id;
  String? name;

  MenuCategory({this.id, this.name});

  MenuCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Restaurant {
  String? coordinate;

  Restaurant({this.coordinate});

  Restaurant.fromJson(Map<String, dynamic> json) {
    coordinate = json['coordinate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinate'] = this.coordinate;
    return data;
  }
}
