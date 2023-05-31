class UserRest {
  int? id;
  String? name;
  String? address;
  String? phone;
  String? description;
  String? imageUrl;
  String? open;
  String? closed;
  int? userId;
  String? cordinate;
  int? deliveryFee;
  String? email;

  UserRest(
      {this.id,
      this.name,
      this.address,
      this.phone,
      this.description,
      this.imageUrl,
      this.open,
      this.closed,
      this.userId,
      this.cordinate,
      this.deliveryFee,
      this.email});

  UserRest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    description = json['description'];
    imageUrl = json['image_url'];
    open = json['open'];
    closed = json['closed'];
    userId = json['user_id'];
    cordinate = json['cordinate'];
    deliveryFee = json['delivery_fee'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    data['open'] = this.open;
    data['closed'] = this.closed;
    data['user_id'] = this.userId;
    data['cordinate'] = this.cordinate;
    data['delivery_fee'] = this.deliveryFee;
    data['email'] = this.email;
    return data;
  }
}
