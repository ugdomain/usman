import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Color BtnTextColor = Color(0xFF494c4e);
List<Color> bgColor = [Colors.green[100],Colors.blue[100]];
List<Color> barColor = [Colors.blueGrey[200],Colors.blueGrey[400]];

final HintTextStyle = TextStyle(
  color: Colors.black38,
  fontFamily: 'OpenSans'
);

final boxdecStyle = BoxDecoration(
  gradient: LinearGradient(
    colors: [Color(0x0F4F4F5F5),Color(0x0F4F4F5F5),],
  ),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [BoxShadow(
    color: Colors.black12,
    blurRadius: 6.0,
    offset: Offset(2, 2),
  )
],
);
final textBoxDecStyle = BoxDecoration(
  gradient: LinearGradient(
    colors: [Color(0x0FFFFFFFF),Color(0x0F4F4F5F5),],
  ),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [BoxShadow(
    color: Colors.black45,
    blurRadius: 6.0,
    offset: Offset(2, 2),
  )
  ],
);

final LabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans'
);

final admin = 'usman';
final admin_pass = 'Samb123';