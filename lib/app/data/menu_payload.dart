class MenuPayload {
  int? id;
  int? qty;

  MenuPayload({this.id, this.qty});

  MenuPayload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qty'] = this.qty;
    return data;
  }
}
