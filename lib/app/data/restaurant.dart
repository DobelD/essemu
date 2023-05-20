class Restaurant {
  int? id;
  String? coordinate;

  Restaurant({this.id, this.coordinate});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coordinate = json['coordinate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coordinate'] = this.coordinate;
    return data;
  }
}
