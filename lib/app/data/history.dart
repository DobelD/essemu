class History {
  final int id;
  final int userId;
  final int total;
  final String status;

  History(
      {required this.id,
      required this.userId,
      required this.total,
      required this.status});

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'],
      userId: json['user_id'],
      total: json['total'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['total'] = this.total;
    data['status'] = this.status;
    return data;
  }
}
