import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:silkpharma/Login/constant.dart';
import 'package:silkpharma/api/controls/user_control.dart';
import 'employee_description.dart';
import 'salary_description.dart';

class EmployeeInfo extends StatefulWidget {
  @override

  const EmployeeInfo({Key key}) : super(key : key);

  _EmployeeInfoState createState() => _EmployeeInfoState();
}

class _EmployeeInfoState extends State<EmployeeInfo> {
  _EmployeeInfoState();
  var _user = new UserAPIServices();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0x0ff1c1f22)),
          title: Text('Employee Information',style: TextStyle(color: Color(0x0ff1c1f22)),),
          backgroundColor: Color(0x0fff4f4f5),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            labelPadding: EdgeInsets.only(bottom: 7,),
            indicatorColor: Color(0x0ff1c1f22),
            indicatorWeight: 4,
            tabs: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person,color: Color(0x0ff1c1f22),),
                    Text('EMPLOYEES',style: TextStyle(color: Color(0x0ff1c1f22),fontWeight: FontWeight.bold,letterSpacing: 2,fontSize: 15,),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.monetization_on_outlined,color: Color(0x0ff1c1f22),),
                    Text('SALARY',style: TextStyle(color: Color(0x0ff1c1f22),letterSpacing: 2,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            Container(
              decoration: boxdecStyle,
              child: EmployeeDescription(),
            ),
            Container(
              decoration: boxdecStyle,
              padding: EdgeInsets.all(10),
              child: FutureBuilder(
                future: _user.fetchUser(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                  return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, index){
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      width: size.width * .25,
                      height: size.height * .30,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalaryDesc(
                                id : snapshot.data[index].userId ,name: '${snapshot.data[index].fullname}',)));
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/anonymous.png'),
                              radius: 30,
                            ),
                          ),
                          Text('${snapshot.data[index].fullname}')
                        ],
                      ),
                    );
                  },
                );}else{
                    return Transform.scale(
                        scale: .1,
                        child: CircularProgressIndicator(color: Colors.black,));
                  }
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
