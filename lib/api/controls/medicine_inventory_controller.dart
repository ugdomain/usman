import 'dart:convert';
import 'package:silkpharma/api/models/medicine_inventory_model.dart';
import 'package:http/http.dart' as http;
import 'constant.dart';

class InventoryApiService {
  static var inventoryUrl = '${Url.url}productunit/';

  Future fetchMedicineInventory(String medicine) async {
    var response = await http.get(Uri.parse(inventoryUrl + '$medicine'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((sale) => Inventory.fromJson(sale)).toList();
    } else {
      throw Exception("Failed to upload sales list");
    }
  }
}