class OrderRest {
  int? id;
  int? userId;
  int? orderDate;
  int? totalPrice;
  String? status;
  int? deliveryFee;
  int? restaurantId;
  String? address;
  Users? users;

  OrderRest(
      {this.id,
      this.userId,
      this.orderDate,
      this.totalPrice,
      this.status,
      this.deliveryFee,
      this.restaurantId,
      this.address,
      this.users});

  OrderRest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderDate = json['order_date'];
    totalPrice = json['total_price'];
    status = json['status'];
    deliveryFee = json['delivery_fee'];
    restaurantId = json['restaurant_id'];
    address = json['address'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
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
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
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
