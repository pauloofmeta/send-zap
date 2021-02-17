import 'dart:convert';

History historyFromJson(String str) {
  final jsonData = json.decode(str);
  return History.formMap(jsonData);
}

String historyToJson(History history) {
  final data = history.toMap();
  return json.encode(data);
}

class History {
  int id;
  String phone;
  String description;
  String message;

  History({
    this.id,
    this.phone,
    this.description,
    this.message
  });

  factory History.formMap(Map<String, dynamic> json) => new History(
    id: json["id"],
    phone: json["phone"],
    description: json["description"],
    message: json["message"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "phone": phone,
    "description": description,
    "message": message
  };
}