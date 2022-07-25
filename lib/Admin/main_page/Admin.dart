import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silkpharma/Admin/Employee_Info/employee_info.dart';
import 'package:silkpharma/Admin/SellPurchase_report/sell_purchase.dart';
import 'package:silkpharma/Admin/medicine_info/medicine_information.dart';
import 'package:silkpharma/Admin/main_page/configuration.dart';
import 'package:silkpharma/Admin/medicine_inventory/medicine_inventory.dart';
import 'package:silkpharma/Admin/profit_loss_report/profit_loss_main.dart';
import 'package:silkpharma/Admin/supplier_info/supplier_info_main.dart';
import 'package:silkpharma/Customer/configuration.dart';

import 'top_text_screen.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  bool _isMenuOpen = false;
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
  @override
  Widget build(BuildContext context) {
    DateTime timeBackPressed = DateTime.now();
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: (_backButtonPressed),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: size.height,
              margin: EdgeInsets.only(top: size.height*.09),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0x0F4F4F5F5),Color(0x0F4F4F5F5),
                  ]
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: GridView.count(
                  mainAxisSpacing: 30.0,
                  crossAxisSpacing: 30.0,
                  padding : EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                  crossAxisCount: 2,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: bgColor),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(offset: Offset(2,4),color: Colors.black26)],
                    ),
                      child: Container(
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.all(2),
                        decoration: outerBoxDec,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeInfo()));
                          },
                          child: CircleAvatar(foregroundImage: AssetImage('assets/images/employee.png',),radius: 70,),
                        ),
                      ),
                    ),
                    Container(decoration: BoxDecoration(gradient: LinearGradient(colors: bgColor),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(offset: Offset(2,4),color: Colors.black26)]
                    ),
                      child: Container(
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.all(2),
                        decoration: outerBoxDec,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MedicineInventory()));
                          },
                          child: CircleAvatar(backgroundImage: AssetImage('assets/images/inventory.png',),radius: 70,),
                        ),
                      ),
                    ),
                    Container(decoration: BoxDecoration(gradient: LinearGradient(colors: bgColor),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(offset: Offset(2,4),color: Colors.black26)]
                    ),
                      child: Container(
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.all(2),
                        decoration: outerBoxDec,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfitLoss()));
                          },
                          child: CircleAvatar(backgroundColor: Colors.black,foregroundImage: AssetImage('assets/images/profit.png',),radius: 70,),
                        ),
                      ),
                    ),
                    Container(decoration: BoxDecoration(gradient: LinearGradient(colors: bgColor),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(offset: Offset(2,4),color: Colors.black26)]
                    ),
                      child: Container(
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.all(2),
                        decoration: outerBoxDec,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SellPurchaseMain()));
                          },
                          child: CircleAvatar(backgroundColor: Colors.black,foregroundImage: AssetImage('assets/images/buysell.jpg',),radius: 70,),
                        ),
                      ),
                    ),
                    Container(decoration: BoxDecoration(gradient: LinearGradient(colors: bgColor),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(offset: Offset(2,4),color: Colors.black26)]
                    ),
                      child: Container(
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.all(2),
                        decoration: outerBoxDec,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SupplierInfoMain()));
                          },
                          child: CircleAvatar(backgroundColor: Colors.black,foregroundImage: AssetImage('assets/images/supplier.png',),radius: 70,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TopTextScreen(),
          ],
        ), // backgroundColor: Colors.blueGrey,
      ),
    );
  }

  Future<bool> _backButtonPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Do you really want to exit the app ?'),
          actions: [
            TextButton(
              onPressed: ()=> Navigator.pop(context,false),
            child: Text('No'),),
            TextButton(
              child: Text('Yes'),
              onPressed: ()=>Navigator.pop(context,exit(0)),
            )
          ],
        )
    );
  }
}
