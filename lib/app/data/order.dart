class Order {
  final int id;
  final int userId;
  final int orderDate;
  final int totalPrice;
  final String status;
  final int restaurantId;

  Order(
      {required this.id,
      required this.userId,
      required this.orderDate,
      required this.totalPrice,
      required this.status,
      required this.restaurantId});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json['id'],
        userId: json['user_id'],
        orderDate: json['order_date'],
        totalPrice: json['total_price'],
        status: json['status'],
        restaurantId: json['restaurant_id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_date'] = this.orderDate;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    data['restaurant_id'] = this.restaurantId;
    return data;
  }
}



// class Favorite {
//   final int id;
//   final int userId;
//   final int menuId;
//   final Menu menu; // Menambahkan properti menu

//   Favorite({
//     required this.id,
//     required this.userId,
//     required this.menuId,
//     required this.menu,
//   });

//   factory Favorite.fromJson(Map<String, dynamic> json, {Menu? menu}) {
//     return Favorite(
//       id: json['id'],
//       userId: json['user_id'],
//       menuId: json['menu_id'],
//       menu: menu ??
//           Menu.fromJson(
//               json), // Menggunakan objek menu yang diteruskan jika ada
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'user_id': userId,
//       'menu_id': menuId,
//       'menu': menu.toJson(), // Menambahkan properti menu dalam JSON
//     };
//   }
// }

// class Menu {
//   int? id;
//   String? name;
//   String? description;
//   int? price;
//   String? imageUrl;
//   bool? favorit;
//   MenuCategory? categories;
//   Restaurant? restaurant;

//   Menu(
//       {this.id,
//       this.name,
//       this.description,
//       this.price,
//       this.imageUrl,
//       this.favorit,
//       this.categories,
//       this.restaurant});

//   Menu.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     price = json['price'];
//     imageUrl = json['image_url'];
//     favorit = json['favorit'];
//     categories = json['categories'] != null
//         ? new MenuCategory.fromJson(json['categories'])
//         : null;
//     restaurant = json['restaurant'] != null
//         ? new Restaurant.fromJson(json['restaurant'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['price'] = this.price;
//     data['image_url'] = this.imageUrl;
//     data['favorit'] = this.favorit;
//     if (this.categories != null) {
//       data['categories'] = this.categories!.toJson();
//     }
//     if (this.restaurant != null) {
//       data['restaurant'] = this.restaurant!.toJson();
//     }
//     return data;
//   }
// }

// class MenuCategory {
//   int? id;
//   String? name;

//   MenuCategory({this.id, this.name});

//   MenuCategory.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class Restaurant {
//   String? coordinate;

//   Restaurant({this.coordinate});

//   Restaurant.fromJson(Map<String, dynamic> json) {
//     coordinate = json['coordinate'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['coordinate'] = this.coordinate;
//     return data;
//   }
// }
