import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:silkpharma/api/models/purchase_model.dart';
import 'constant.dart';

class PurchaseAPIServices {
  static var purchaseUrl = "${Url.url}purchaseorder/";

  Future fetchUnitPurchase(String ProductName, String TypeName) async {
    var response = await http.get(
        Uri.parse(purchaseUrl + '$ProductName/$TypeName'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((purchase) => UnitPurchase.fromJson(purchase)).toList();
    } else {
      throw Exception("Failed to upload user list");
    }
  }

  Future fetchDailyPurchase(String date) async {
    var response = await http.get(
        Uri.parse(purchaseUrl + '$date'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((purchase) => DailyPurchase.fromJson(purchase)).toList();
    } else {
      throw Exception("Failed to upload user list");
    }
  }

  Future fetchMonthlyPurchase(int month) async {
    var response = await http.get(
        Uri.parse(purchaseUrl + 'day/$month/year'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((purchase) => MonthlyPurchase.fromJson(purchase)).toList();
    } else {
      throw Exception("Failed to upload user list");
    }
  }

}
