// To parse this JSON data, do
//
//     final purchase = purchaseFromMap(jsonString);

import 'dart:convert';

class UnitPurchase {
  UnitPurchase({
    this.unitPrice,
    this.quantity,
  });

  double unitPrice;
  double quantity;

  factory UnitPurchase.fromJson(Map<String, dynamic> json) => UnitPurchase(
    unitPrice: json["unit_price"] as double,
    quantity: json["quantity"] as double,
  );

  Map<String, dynamic> toMap() => {
    "unit_price": unitPrice,
    "quantity": quantity,
  };
}

class DailyPurchase {
  DailyPurchase({
    this.TotalPrice,
  });

  double TotalPrice;

  factory DailyPurchase.fromJson(Map<String, dynamic> json) => DailyPurchase(
    TotalPrice: json["total_purchase"] as double
  );

  Map<String, dynamic> toMap() => {
    "total_purchase": TotalPrice
  };
}


class MonthlyPurchase {
  MonthlyPurchase({
    this.TotalPrice,
  });

  double TotalPrice;

  factory MonthlyPurchase.fromJson(Map<String, dynamic> json) => MonthlyPurchase(
      TotalPrice: json["total_purchase"] as double
  );

  Map<String, dynamic> toMap() => {
    "total_purchase": TotalPrice
  };
}
