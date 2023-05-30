class HistoryItem {
  int? id;
  int? historyId;
  int? menuId;
  int? qty;
  Menu? menu;

  HistoryItem({this.id, this.historyId, this.menuId, this.qty, this.menu});

  HistoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    historyId = json['history_id'];
    menuId = json['menu_id'];
    qty = json['qty'];
    menu = json['menu'] != null ? new Menu.fromJson(json['menu']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['history_id'] = this.historyId;
    data['menu_id'] = this.menuId;
    data['qty'] = this.qty;
    if (this.menu != null) {
      data['menu'] = this.menu!.toJson();
    }
    return data;
  }
}

class Menu {
  String? name;
  int? price;

  Menu({this.name, this.price});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
