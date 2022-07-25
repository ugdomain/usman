import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:silkpharma/api/models/userModel.dart';

import 'constant.dart';

class UserAPIServices {
  static var userUrl = "${Url.url}user";

  Future fetchUser() async {
    var response = await http.get(Uri.parse(userUrl));
    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((user) => User.fromJson(user)).toList();
    }else{
      throw Exception("Failed to upload user list");
    }
  }

  static Map<String, String> header = {
    'content-type': 'application/json'
  };

  String postUser(User user){
    final myUser = user.toJson();
    return json.encode(myUser);
    // var res =
    // return res.statusCode == 201;
  }

  Future<http.Response> createUser(User user)async{
    final response = await http.post(Uri.parse(userUrl),headers: header,body: postUser(user));
    return response;
  }

  Future<http.Response> updateUser(User user)async{
    final response = await http.put(
      Uri.parse(userUrl),
      headers: header,
      body: postUser(user),
    );
    return response;
  }

  Future<http.Response> deleteUser(int id)async{
    var res = await http.delete(Uri.parse("$userUrl/$id"),headers:header);
    return res;
  }
}

class UserSalaryApiServices{
  static var userSalaryUrl = "${Url.url}usersalary/";

  Future fetchUserSalary(int id,String month) async {
    var response = await http.get(Uri.parse(userSalaryUrl+'$id/$month'));
    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((user) => UserSalary.fromJson(user)).toList();
    }else{
      throw Exception("Failed to upload user list");
    }
  }

  static Map<String, String> header = {
    'content-type': 'application/json'
  };

  String postUserSalary(UserSalary user){
    final myUser = user.toJson();
    return json.encode(myUser);
    // var res =
    // return res.statusCode == 201;
  }

  Future<http.Response> createUserSalary(UserSalary salary)async{
    final response = await http.post(Uri.parse(userSalaryUrl),headers: header,body: postUserSalary(salary));
    return response;
  }

  Future<http.Response> updateUserSalary(UserSalary salary)async{
    final response = await http.put(
      Uri.parse(userSalaryUrl),
      headers: header,
      body: postUserSalary(salary),
    );
    return response;
  }

  Future<http.Response> deleteUserSalary(int id)async{
    var res = await http.delete(Uri.parse("$userSalaryUrl/$id"),headers:header);
    return res;
  }
}