class Request {
  int id;
  DateTime created;
  String status;

  Request({
    this.id = -1,
    required this.created,
    required this.status,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        status: json["status"],
      );

  Request copyWith({
    int? id,
    DateTime? created,
    String? status,
  }) {
    return Request(
      id: id ?? this.id,
      created: created ?? this.created,
      status: status ?? this.status,
    );
  }
}

enum RequestStatus {
  pending,
  accepted,
  declined
}