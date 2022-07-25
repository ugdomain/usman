import 'dart:convert';
import 'package:silkpharma/api/models/sale_model.dart';
import 'package:http/http.dart' as http;
import 'constant.dart';

class SaleApiService{
  static var salesUrl = '${Url.url}sale/';

  Future fetchUnitSale(String medicine,String type)async{
    var response = await http.get(Uri.parse(salesUrl+'$medicine/$type'));
    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((sale) => UnitSale.fromJson(sale)).toList();
    }else{
      throw Exception("Failed to upload sales list");
    }
  }

  Future fetchDailySale(String date)async{
    var response = await http.get(Uri.parse(salesUrl+'$date'));
    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((sale) => DailySale.fromJson(sale)).toList();
    }else{
      throw Exception("Failed to upload sales list");
    }
  }


  Future fetchMonthlySale(int month)async{
    var response = await http.get(Uri.parse(salesUrl+'day/$month/year'));
    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((sale) => MonthlySale.fromJson(sale)).toList();
    }else{
      throw Exception("Failed to upload sales list");
    }
  }

}