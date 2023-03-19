class FavoriteModel {
  Data? data;

  FavoriteModel({this.data});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Favorite>? favorite;

  Data({this.favorite});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['favorite'] != null) {
      favorite = <Favorite>[];
      json['favorite'].forEach((v) {
        favorite!.add(new Favorite.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.favorite != null) {
      data['favorite'] = this.favorite!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Favorite {
  int? id;
  Menu? menu;

  Favorite({this.id, this.menu});

  Favorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menu = json['menu'] != null ? new Menu.fromJson(json['menu']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.menu != null) {
      data['menu'] = this.menu!.toJson();
    }
    return data;
  }
}

class Menu {
  String? name;
  String? description;
  int? price;

  Menu({this.name, this.description, this.price});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    return data;
  }
}
