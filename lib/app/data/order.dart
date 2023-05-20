class Order {
  final int id;
  final int userId;
  final String orderDate;
  final String totalPrice;
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
