class Order {
  final int id;
  final int userId;
  final int orderDate;
  final int totalPrice;
  final String status;
  final int deliveryFee;
  final int restaurantId;

  Order(
      {required this.id,
      required this.userId,
      required this.orderDate,
      required this.totalPrice,
      required this.status,
      required this.deliveryFee,
      required this.restaurantId});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json['id'],
        userId: json['user_id'],
        orderDate: json['order_date'],
        totalPrice: json['total_price'],
        status: json['status'],
        deliveryFee: json['delivery_fee'],
        restaurantId: json['restaurant_id']);
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
    return data;
  }
}
