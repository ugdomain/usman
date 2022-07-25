import 'dart:convert';

class Profit {
  Profit({
    this.profit,
  });

  String profit;

  factory Profit.fromJson(String str) => Profit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Profit.fromMap(Map<String, dynamic> json) => Profit(
    profit: json["profit"] as String,
  );

  Map<String, dynamic> toMap() => {
    "profit": profit,
  };
}
