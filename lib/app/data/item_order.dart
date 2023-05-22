class ItemOrder {
  final int id;
  final int orderId;
  final int menuId;
  final int quantity;
  final Menu menu;

  ItemOrder({
    required this.id,
    required this.orderId,
    required this.menuId,
    required this.quantity,
    required this.menu,
  });

  factory ItemOrder.fromJson(Map<String, dynamic> json, {Menu? menu}) {
    return ItemOrder(
      id: json['id'],
      orderId: json['order_id'],
      menuId: json['menu_id'],
      quantity: json['quantity'],
      menu: menu ?? Menu.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['menu_id'] = this.menuId;
    data['quantity'] = this.quantity;
    data['menu'] = menu.toJson();
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

  Menu(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.imageUrl,
      this.favorit});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['image_url'];
    favorit = json['favorit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;
    data['favorit'] = this.favorit;
    return data;
  }
}
