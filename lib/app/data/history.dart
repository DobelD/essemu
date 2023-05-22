class History {
  int? id;
  int? createdAt;
  int? userId;
  int? total;
  String? status;
  Restaurant? restaurant;

  History(
      {this.id,
      this.createdAt,
      this.userId,
      this.total,
      this.status,
      this.restaurant});

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    total = json['total'];
    status = json['status'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = createdAt;
    data['user_id'] = this.userId;
    data['total'] = this.total;
    data['status'] = this.status;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant!.toJson();
    }
    return data;
  }
}

class Restaurant {
  String? name;
  String? address;
  String? phone;

  Restaurant({this.name, this.address, this.phone});

  Restaurant.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;

    return data;
  }
}
