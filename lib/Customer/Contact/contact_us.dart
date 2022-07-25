import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silkpharma/Login/constant.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = TextStyle(fontSize: 15,fontWeight: FontWeight.bold,letterSpacing: 1,color: Colors.black);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Contact Infornation'),centerTitle: true,),
      body: Container(decoration: boxdecStyle,
      width: size.width,
      height: size.height,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Phone : 091-2581501',style: _textStyle,),
          Text('P.O.Box : 25000',style: _textStyle,),
          Text('Fax : 091-2218830',style: _textStyle,),
          Text('Working time : 8:00 AM To 6:00 PM',style: _textStyle,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 42.0),
                child: Text('Location : ',style: _textStyle,),
              ),
              SafeArea(
                child: Expanded(
                  child: RichText(
                  text: TextSpan(text: 'Office No.1',
                    style: _textStyle,
                  children: [
                    TextSpan(text: ' , 1st Floor \nHilal-e-Ahmar Building \nBlood Bank Block, Dabgari \nGarden Peshawar - Pakistan',style: _textStyle)],
          ),),
                ),
              ),]),
        ],
      ),
      ),
    );
  }
}
