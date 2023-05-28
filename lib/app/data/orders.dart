class Order {
  final int id;
  final int userId;
  final int orderDate;
  final int totalPrice;
  final String status;
  final int deliveryFee;
  final int restaurantId;
  final String address;
  final Users user;

  Order(
      {required this.id,
      required this.userId,
      required this.orderDate,
      required this.totalPrice,
      required this.status,
      required this.deliveryFee,
      required this.restaurantId,
      required this.address,
      required this.user});

  factory Order.fromJson(Map<String, dynamic> json, {Users? user}) {
    return Order(
        id: json['id'],
        userId: json['user_id'],
        orderDate: json['order_date'],
        totalPrice: json['total_price'],
        status: json['status'],
        deliveryFee: json['delivery_fee'],
        restaurantId: json['restaurant_id'],
        address: json['address'],
        user: user ?? Users.fromJson(json));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_date'] = this.orderDate;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    data['delivery_fee'] = this.deliveryFee;
    data['restaurant_id'] = this.restaurantId;
    data['address'] = this.address;
    data['users'] = user.toJson();
    return data;
  }
}

class Users {
  int? id;
  String? name;
  String? phone;

  Users({this.id, this.name, this.phone});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}
