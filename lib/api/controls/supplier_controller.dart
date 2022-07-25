import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:silkpharma/api/models/supplierModel.dart';

import 'constant.dart';

class SupplierAPIServices {
  static var supplierUrl = "${Url.url}supplier";
  Future fetchSupplier() async {
    var response = await http.get(Uri.parse(supplierUrl));
    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((supplier) => Supplier.fromJson(supplier)).toList();
    }else{
      throw Exception("Failed to upload user list");
    }
  }

  static Map<String, String> header = {
    'content-type': 'application/json'
  };

  String postSupplier(Supplier supplier){
    final mySupplier = supplier.toJson();
    return json.encode(mySupplier);
  }

  Future<http.Response> createSupplier(Supplier supplier)async{
    final response = await http.post(Uri.parse(supplierUrl),headers: header,body: postSupplier(supplier));
    return response;
  }

  Future<http.Response> updateSupplier(Supplier supplier)async{
    final response = await http.put(
      Uri.parse(supplierUrl),
      headers: header,
      body: postSupplier(supplier),
    );
    return response;
  }

  Future<http.Response> deleteSupplier(int id)async{
    var res = await http.delete(Uri.parse("$supplierUrl/$id"),headers:header);
    return res;
  }
}