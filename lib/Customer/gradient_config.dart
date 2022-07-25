import 'package:flutter/material.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';

class GradColorText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GradientText(
        text: "Silk Pharma",
        colors: [Colors.amber,Colors.red],
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

