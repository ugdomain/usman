import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:silkpharma/api/models/profit_model.dart';

import 'constant.dart';

class ProfitApiServices{

  static var profitUrl = "${Url.url}profitloss/";

  Future fetchProfit(String date) async{
    var response = await http.get(Uri.parse(profitUrl+"$date"));
    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((e) => Profit.fromMap(e)).toList();
    }else{
      throw Exception("Failed to upload profit list");
    }
  }

  Future fetchMonthlyProfit(String month,String year) async{
    var response = await http.get(Uri.parse(profitUrl+"$month/$year"));
    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((e) => Profit.fromMap(e)).toList();
    }else{
      throw Exception("Failed to upload profit list");
    }
  }

}