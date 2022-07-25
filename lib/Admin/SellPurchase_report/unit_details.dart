import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:silkpharma/Admin/Employee_Info/configuration.dart';
import 'package:silkpharma/Login/constant.dart';
import 'package:silkpharma/Login/constant.dart';
import 'package:silkpharma/api/controls/purchase_controller.dart';
import 'package:silkpharma/api/controls/sales_controller.dart';
import 'package:silkpharma/api/models/purchase_model.dart';

class unitDetails extends StatefulWidget {
  const unitDetails({Key key}) :  super(key: key);

  @override
  _unitDetailsState createState() => _unitDetailsState();
}

class _unitDetailsState extends State<unitDetails> {

  TextEditingController _nameCon = new TextEditingController();
  String valueChoose = "CREAM";
  var purchase,sale;
  bool circular = true;
  List listItem = [
    'EYE DROPS','BALM','CAP','CARTGE','CREAM','DROPS','FACEWASH','GEL',
    'INFUSION','INHALER','INJ','LOTION','LOZENGES','MOUTHWASH','OIL',
    'OINTMENT','OVULES','PASTE','PEN','SACHET','SHAMPOO','SOAP','SOLUTION',
    'SPRAY','SUPPOSITORIES','SUSPENSION','SYRUP','TAB','TOOTHPASTE','TUBE',
    'VACCINE'
  ];

  Invocation get invocation => null;

  @override
  void dispose() {
    super.dispose();
    _nameCon.dispose();
  }

  @override
  void initState() {
    super.initState();
    try{
      _nameCon.text.isNotEmpty ;
      valueChoose;
    }catch (ex){
      throw Exception(ex.toString());
    }

  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    // purchase = PurchaseAPIServices().fetchUnitPurchase(_nameCon.text != null ? _nameCon.text: "",valueChoose);
    // sale = SaleApiService().fetchUnitSale(_nameCon.text != null ? _nameCon.text: "", valueChoose != null ? valueChoose:"");
    circular = false;
  }

  @override
  Widget build(BuildContext context) {
    purchase = PurchaseAPIServices().fetchUnitPurchase(_nameCon.text != null ? _nameCon.text: "", valueChoose != null ? valueChoose:"");
    sale = SaleApiService().fetchUnitSale(_nameCon.text != null ? _nameCon.text: "", valueChoose != null ? valueChoose:"");
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: size.width,
      height: size.height,
      decoration: boxdecStyle,
      child: Column(
        children: [
          Container(
            width: 400,
            child: Card(
              color: Colors.white.withOpacity(0.75),
              margin: EdgeInsets.only(
                  top: 20.0, left: 20.0, right: 10.0, bottom: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  maxLength: 30,
                  controller: _nameCon,
                  decoration: InputDecoration(
                      hintText: 'Enter Medicine Name',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            _nameCon = _nameCon;
                          });
                        },
                      ),
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(height: 30,),
          Container(
            width: 400,
            child: Card(
              color: Colors.white.withOpacity(0.75),
              margin: EdgeInsets.only(
                  top: 20.0, left: 20.0, right: 10.0, bottom: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 3,
              child: DropdownButton(
                hint: Text('Select type',),
                dropdownColor: Colors.white,
                isExpanded: true,
                value: valueChoose,
                onChanged: (newValue){
                  setState(() {
                    valueChoose = newValue;
                  });
                },
                items: listItem.map((valueItem){
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem,style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: Container(
              height: 100,
              child:FutureBuilder(
                future: purchase,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: boxdecStyle,
                        child: Column(
                          children: [
                            Container(margin: EdgeInsets.symmetric(vertical: 10),
                                child:  circular || snapshot.hasError? Text('Purchase Price : 0',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                            :Text('Purchase Price : ${snapshot.data[index].unitPrice}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                            Container(margin: EdgeInsets.symmetric(vertical: 10),
                                child: circular || snapshot.hasError? Text('Quantity purchased : 0',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                            :Text('Quantity purchased : ${snapshot.data[index].quantity}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              child:FutureBuilder(
                future: sale,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Expanded(
                        child: Container(
                          decoration: boxdecStyle,
                          child: Column(
                            children: [
                              Container(margin: EdgeInsets.symmetric(vertical: 10),
                                  child:  circular || snapshot.hasError ? Text('Sale Price : 0',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                                      :Text('Sale Price : ${snapshot.data[index].Price}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                              Container(margin: EdgeInsets.symmetric(vertical: 10),
                                  child: circular || snapshot.hasError? Text('Quantity sold : 0',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                                      :Text('Quantity sold : ${snapshot.data[index].quantity}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
