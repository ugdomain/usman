import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silkpharma/Admin/medicine_info/medicine_information.dart';
import 'package:silkpharma/Customer/About/about_us.dart';
import 'package:silkpharma/Customer/configuration.dart';
import 'package:silkpharma/Customer/medicine_availability/available_medicine.dart';
import 'Contact/contact_us.dart';

class DrawerScreen extends StatefulWidget {

  final LinearGradient _gradient = LinearGradient(colors: [Colors.red,Colors.blue]);
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: barColor,
        ),
      ),
      padding: EdgeInsets.only(top: 50,bottom: 50,left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/myPic.png'),),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Usman Ghani',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text('Active Status',style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.bold,fontSize: 10),)
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: drawerItems.map((e) => Padding(
              padding: const EdgeInsets.only(left: 2,bottom: 28),
              child: Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueGrey[400].withOpacity(0.25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      elevation: 18,
                      shadowColor: Colors.black,
                      primary: btnTextColor,
                    ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          width: 140,
                          margin: EdgeInsets.all(10),
                            child: Text(e['title'],)),
                      ),
                      onPressed: (){
                        if(e['title']== 'Medicine Information')
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MedicineInfo()));
                        else if(e['title']== 'Available Medicine')
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AvailableMedicine()));
                        else if(e['title'] == 'Contact Us')
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactInfo()));
                        else
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUs()));
                      },
                      ),
                ],
              ),
            )).toList(),
          ),
          Row(
            children: [
              Icon(Icons.settings,color: Colors.black,),
              SizedBox(width: 10,),
              Text('Settings',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
              SizedBox(width: 10,),
              Container(width: 2,height: 20,color: Colors.white,),
              SizedBox(width: 10,),
              Text('Log out',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
            ],
          )
        ],
      ),
    );
  }
}
