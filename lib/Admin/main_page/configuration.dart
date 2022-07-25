import 'package:flutter/material.dart';

List _list = [
  Row(
    children: [
      SizedBox(width: 50,),
      Icon(Icons.keyboard_arrow_up_sharp),
    ],
  ),
  Row(
    children: [
      IconButton(icon: Icon(Icons.settings), onPressed: (){},),
      Text('Settings'),
    ],
  ),
  SizedBox(height: 30,),
  Row(
    children:[
      IconButton(icon: Icon(Icons.logout), onPressed: (){},),
      Text('Log Out'),],
  )
];

TextStyle btnTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.blue[100],
  backgroundColor: Colors.blueGrey,
);

BoxDecoration outerBoxDec = BoxDecoration(
  color: Color(0x0ff494c4e),
  border: Border.all(
    style: BorderStyle.solid,
    width: 2,
    color: Color(0x0ff55aaff),
  ),
  borderRadius: BorderRadius.circular(20),
  boxShadow: [BoxShadow(
    color: Color(0x0ff55aaff),
    blurRadius: 4,
  )],
);