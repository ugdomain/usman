

class Supplier {
  Supplier({
    this.supplier_id,
    this.supplier_code,
    this.supplier_name,
    this.supplier_contact,
    this.supplier_address,
    this.supplier_email,
    this.supplier_state,
    this.supplier_country,
  });

  int supplier_id;
  String supplier_code;
  String supplier_name;
  String supplier_contact;
  String supplier_address;
  String supplier_email;
  String supplier_state;
  String supplier_country;

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
    supplier_id: json["supplier_id"]as int,
    supplier_code: json["supplier_code"]as String,
    supplier_name: json["supplier_name"]as String,
    supplier_contact: json["supplier_contact"]as String,
    supplier_address: json["supplier_address"] as String,
    supplier_email: json["supplier_email"]as String,
    supplier_state: json["supplier_state"]as String,
    supplier_country: json["supplier_country"]as String,
  );

  Map<String, dynamic> toJson() => {
    "supplier_id": supplier_id,
    "supplier_code": supplier_code,
    "supplier_name": supplier_name,
    "supplier_contact": supplier_contact,
    "supplier_address": supplier_address,
    "supplier_email": supplier_email,
    "supplier_state": supplier_state,
    "supplier_country": supplier_country,
  };
}
