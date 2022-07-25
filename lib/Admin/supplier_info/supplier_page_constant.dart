
import 'package:flutter/cupertino.dart';

TextStyle textStyle = TextStyle(color: CupertinoColors.black,fontSize: 15,
fontWeight: FontWeight.normal);

class Suppliers{
  final String companyName;
  final String address;
  final String phone;
  final String email;
  final String location;

  Suppliers({this.companyName,this.address,this.phone,this.email,this.location});
}