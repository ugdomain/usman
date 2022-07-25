import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:silkpharma/Admin/Employee_Info/configuration.dart';


class TopTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .18,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0x0ffffffff),Color(0x0ffffffff)],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          )
      ),
      child: Column(
        children: [
          Text('Silk Pharma', style: TextStyle(fontSize: 30.0,color: Colors.black),),
          Text('Admin Panel', style: TextStyle(fontSize: 20.0,color: Colors.black),),
        ],
      ),
    );
  }
}
