import 'dart:convert';

class Inventory {
  Inventory({
    this.Batch_No,
    this.product,
    this.type_name,
    this.supplier,
    this.purchase_price,
    this.quantity,
    this.purchaseDate,
    this.mfg_date,
    this.exp_date
  });

  String Batch_No;
  String product;
  String type_name;
  String supplier;
  double purchase_price;
  double quantity;
  String purchaseDate;
  String mfg_date;
  String exp_date;

  factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
    Batch_No: json["Batch_No"]as String,
    product: json["product"]as String,
    type_name: json["type_name"]as String,
    supplier: json["supplier"]as String,
    purchase_price: json["unit_price"] as double,
    quantity: json["quantity"]as double,
    purchaseDate: json["purchaseDate"] as String,
    mfg_date: json["mfg_date"]as String,
    exp_date: json["exp_date"] as String
  );

  Map<String, dynamic> toJson() => {
    "Batch_No": Batch_No,
    "product": product,
    "type_name": type_name,
    "supplier": supplier,
    "unit_price": purchase_price,
    "quantity": quantity,
    "purchaseDate":purchaseDate,
    "mfg_date": mfg_date,
    "exp_date":exp_date
  };
}