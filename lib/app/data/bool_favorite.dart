class FavoriteBool {
  int? id;
  int? userId;
  int? menuId;

  FavoriteBool({this.id, this.userId, this.menuId});

  FavoriteBool.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    menuId = json['menu_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['menu_id'] = this.menuId;
    return data;
  }
}
