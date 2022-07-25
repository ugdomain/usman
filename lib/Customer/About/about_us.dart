import 'package:flutter/material.dart';
import 'package:silkpharma/Login/constant.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxdecStyle,
      child: Text.rich(
          TextSpan(text:'',
          children: [
            TextSpan(),
            TextSpan(),
            TextSpan(),
            TextSpan(),
            TextSpan(),
          ]
      ),
      ),
    );
  }
}
