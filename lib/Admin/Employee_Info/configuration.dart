import 'package:flutter/material.dart';
import 'package:silkpharma/Login/constant.dart';


Image empImage = Image.asset('assets/images/myPic.png',width: 120,height: 120,);

Widget buildTF(String fieldName,int length,TextEditingController controller,TextInputType inputType,IconData icon,onChange) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        fieldName,
        style: LabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: textBoxDecStyle,
        height: 60.0,
        child: TextField(
          maxLength: length,
          controller: controller,
          keyboardType: inputType,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            hintText: 'Enter your $fieldName',
            hintStyle: HintTextStyle,
          ),
          onChanged: onChange,
        ),
      ),

    ],
  );
}

Widget buildBtn(String btnText,Function onPressed) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: onPressed,
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: BtnTextColor,
      child: Text(
        btnText,
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}