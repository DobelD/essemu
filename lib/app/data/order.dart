class Order {
  int? id;
  int? userId;
  String? orderDate;
  String? totalPrice;
  String? status;
  int? restaurantId;

  Order(
      {this.id,
      this.userId,
      this.orderDate,
      this.totalPrice,
      this.status,
      this.restaurantId});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderDate = json['order_date'];
    totalPrice = json['total_price'];
    status = json['status'];
    restaurantId = json['restaurant_id'];
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
