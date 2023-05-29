class HistoryRest {
  int? id;
  int? createdAt;
  int? userId;
  int? total;
  String? status;
  User? user;

  HistoryRest(
      {this.id,
      this.createdAt,
      this.userId,
      this.total,
      this.status,
      this.user});

  HistoryRest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    total = json['total'];
    status = json['status'];
    user = json['users'] != null ? new User.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = createdAt;
    data['user_id'] = this.userId;
    data['total'] = this.total;
    data['status'] = this.status;
    if (this.user != null) {
      data['users'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? address;

  User(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.password,
      this.address});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    return data;
  }
}
