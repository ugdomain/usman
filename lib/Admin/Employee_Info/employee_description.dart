import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:silkpharma/Login/constant.dart';
import 'package:silkpharma/api/controls/user_control.dart';
import 'add_employee.dart';
import 'edit_employee.dart';

var _scaffoldState = GlobalKey<ScaffoldState>();
class EmployeeDescription extends StatefulWidget {
  const EmployeeDescription({Key key}) : super(key: key);

  @override
  _EmployeeDescriptionState createState() => _EmployeeDescriptionState();
}

class _EmployeeDescriptionState extends State<EmployeeDescription> {
  @override
  Widget build(BuildContext context) {
    var userAPI = new UserAPIServices();
    var style = TextStyle(
      color: Colors.black, fontSize: 16, overflow: TextOverflow.fade,fontWeight: FontWeight.bold);
    return Scaffold(
      key: _scaffoldState,
      body: Container(
        decoration: boxdecStyle,
        padding: EdgeInsets.all(15),
        child: FutureBuilder(
          future: userAPI.fetchUser(),
          builder: (context,snapshot) {
            if(snapshot.hasData){
            return Padding(
              padding: EdgeInsets.only(bottom: 15),
              child:ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index) {
                  var postUser = snapshot.data[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Card(
                      elevation: 3,
                      color: Colors.white,
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Username ',style: style),
                                  SizedBox(height: 10,),
                                  Text('Password ',style: style),
                                  SizedBox(height: 10,),
                                  Text('Name ',style: style),
                                  SizedBox(height: 10,),
                                  Text('Designation ',style: style),
                                  SizedBox(height: 10,),
                                  Text('Phone ',style: style),
                                  SizedBox(height: 10,),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(':  ${postUser.username}',style: style),
                                  SizedBox(height: 10,),
                                  Text(':  ${postUser.password}',style: style),
                                  SizedBox(height: 10,),
                                  Text(':  ${postUser.fullname}',style: style),
                                  SizedBox(height: 10,),
                                  Text(':  ${postUser.designation}',style: style),
                                  SizedBox(height: 10,),
                                  Text(':  ${postUser.contact}',style: style),
                                  SizedBox(height: 10,),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                    EditEmployee(
                                      id: postUser.userId,
                                      username: postUser.username,
                                      password: postUser.password,
                                      fullname: postUser.fullname,
                                      designation: postUser.designation,
                                      phone: postUser.contact,
                                    ))),
                                child: Text("Edit",style: TextStyle(color: Colors.blue),),),
                              postUser.designation != "Admin"?
                              TextButton(onPressed: (){
                                showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    title: Text("Delete Data"),
                                    content: Text(
                                      "Are you sure want to delete ${postUser.fullname}?"),
                                    actions: [
                                      TextButton(
                                        child: Text("Yes"),
                                        onPressed: (){
                                          setState(() {
                                            userAPI.deleteUser(postUser.userId).then((response){
                                              if(response.statusCode == 200){
                                                showsnackBarMessage("Data deleted Successfully");
                                              }else{
                                                print("error : " + response.statusCode.toString());
                                              }
                                              Navigator.pop(context);
                                            });
                                          });
                                        },
                                      ),
                                      TextButton(
                                        onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("No"),)
                                    ],
                                  );
                                });
                              }, child: Text("Delete",style: TextStyle(color: Colors.red),),):Text(''),
                            ],
                          ),
                        ],
                      ),
                    )),
                  );},
              ),
            );
            }else{
              return Center(
                child: Transform.scale(
                  scale: .1,
                    child: CircularProgressIndicator(color: Colors.black,)),
              );
            }},
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0x0ff494c4e),
        foregroundColor: Color(0x0ffffffff),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddEmployee())),
        child: Icon(Icons.add),
      ),
    );
  }
  showsnackBarMessage(String message) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}