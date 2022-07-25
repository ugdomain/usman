import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silkpharma/Customer/configuration.dart';
import 'configuration.dart';

class MedicineInformation extends StatefulWidget {
  @override
  _MedicineInformationState createState() => _MedicineInformationState();
}

class _MedicineInformationState extends State<MedicineInformation> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  double tleft = 0;
  double bleft = 0;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0x0fff4f4f5),Color(0x0fff4f4f5)],
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(tleft),
            bottomLeft: Radius.circular(bleft),
        ),
      ),
      child: Column(
        children: [
      SizedBox(height: 30,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isDrawerOpen?IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: (){
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                        tleft = 0;
                        bleft = 0;
                      });}
                ) : IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    setState(() {
                      xOffset = 230;
                      yOffset = 150;
                      scaleFactor = 0.6;
                      isDrawerOpen = true;
                      tleft = 20;
                      bleft = 20;
                    });
                  },
                ),
                SizedBox(width: 70,),
                Text(
                        "Silk Pharma",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 2,

                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: 180,),
        ],
      ),
    );
  }
}