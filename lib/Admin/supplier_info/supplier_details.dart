import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:silkpharma/Login/constant.dart';

class SupplierDetails extends StatefulWidget {
  const SupplierDetails({
    Key key,
    @required int id,
    @required String code,
    @required String name,
    @required String phone,
    @required String address,
    @required String email,
    @required String state,
    @required String country,

  }) : _id = id, _code = code, _name = name, _phone = phone, _address = address, _email = email, _state = state, _country = country, super(key: key);

  final int _id;
  final String _code;
  final String _name;
  final String _phone;
  final String _address;
  final String _email;
  final String _state;
  final String _country;

  @override
  State<SupplierDetails> createState() => _SupplierDetailsState();
}

class _SupplierDetailsState extends State<SupplierDetails> {
  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
      color: Colors.black, fontSize: 15, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.normal);
    return Scaffold(
        appBar: AppBar(
        title: Text('Supplier Details'),
            centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      body: Container(
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          decoration: boxdecStyle,
          child: Padding(padding: EdgeInsets.all(15.0),
                    child: Container(
                      decoration: boxdecStyle,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Name ",style: style,maxLines: 3,),
                                      SizedBox(height: 20,),
                                      Text("Address ",style: style,maxLines: 3,),
                                      SizedBox(height: 20,),
                                      Text("Phone ",style: style,maxLines: 3,),
                                      SizedBox(height: 20,),
                                      Text("Email ",style: style,maxLines: 3,),
                                      SizedBox(height: 20,),
                                      Text("State ",style: style,maxLines: 3,),
                                      SizedBox(height: 20,),
                                      Text("Country ",style: style,maxLines: 3,),
                                      SizedBox(height: 20,),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(":  ${widget._name}",style: style,maxLines: 3,),
                                      SizedBox(height: 20,),
                                      AutoSizeText(":  ${widget._address}",style: style,maxLines: 3,),
                                      SizedBox(height: 20,),
                                      AutoSizeText(":  ${widget._phone}",style: style,maxLines: 3,),
                                      SizedBox(height: 20,),
                                      AutoSizeText(":  ${widget._email}",style: style,maxLines: 3,),
                                      SizedBox(height: 20,),
                                      AutoSizeText(":  ${widget._state}",style: style,maxLines: 3,),
                                      SizedBox(height: 20,),
                                      AutoSizeText(":  ${widget._country}",style: style,maxLines: 3,),
                                      SizedBox(height: 20,),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
    ))
    );
  }
}
