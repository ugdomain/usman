class UnitSale{
  double Price;
  double quantity;

  UnitSale({this.Price,this.quantity});

  factory UnitSale.fromJson(Map<String, dynamic> json) => UnitSale(
      Price : json['sale_unit_price'] as double,
      quantity: json['sale_quantity'] as double
  );

  Map<String, dynamic> toJson() => {
    'sale_unit_price': Price,
    'sale_quantity': quantity
  };
}

class DailySale {
  DailySale({
    this.TotalPrice,
  });

  double TotalPrice;

  factory DailySale.fromJson(Map<String, dynamic> json) => DailySale(
      TotalPrice: json["total_sale"] as double
  );

  Map<String, dynamic> toMap() => {
    "total_sale": TotalPrice
  };
}


class MonthlySale {
  MonthlySale({
    this.TotalPrice,
  });

  double TotalPrice;

  factory MonthlySale.fromJson(Map<String, dynamic> json) => MonthlySale(
      TotalPrice: json["total_sale"] as double
  );

  Map<String, dynamic> toMap() => {
    "total_sale": TotalPrice
  };
}
