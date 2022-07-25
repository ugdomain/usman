import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:silkpharma/Login/constant.dart';
import 'package:silkpharma/api/controls/user_control.dart';
import 'package:silkpharma/api/models/userModel.dart';
import 'package:silkpharma/Admin/Employee_Info/configuration.dart';

var _scaffoldState = GlobalKey<ScaffoldState>();
class AddEmployee extends StatefulWidget {

  int id;
  String username,password,fullname,designation,phone;

  AddEmployee({Key key,this.id,this.username,this.password,this.fullname,this.designation,this.phone}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  _AddEmployeeState();

  TextEditingController _usernameCon = new TextEditingController();
  TextEditingController _passwordCon = new TextEditingController();
  TextEditingController _fullNameCon = new TextEditingController();
  TextEditingController _designationCon = new TextEditingController();
  TextEditingController _phoneCon = new TextEditingController();
  // User _user = new User();

  @override
  void dispose() {
    super.dispose();
    _usernameCon.dispose();
    _passwordCon.dispose();
    _fullNameCon.dispose();
    _designationCon.dispose();
    _phoneCon.dispose();
  }

  File _image;
  final picker = ImagePicker();
  Future getImage()async{
    final image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if(image != null){
      _image = File(image.path);
      }else{
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    UserAPIServices api = new UserAPIServices();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee',style: TextStyle(color: Color(0x0ff1c1f22)),),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      key: _scaffoldState,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: boxdecStyle,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: boxdecStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildTF("User Name",30, _usernameCon, TextInputType.name, Icons.account_box,(v){}),
                SizedBox(height: 20,),
                buildTF("Password",30,_passwordCon , TextInputType.visiblePassword, Icons.account_box,(v){}),
                SizedBox(height: 20,),
                buildTF("Full Name",30, _fullNameCon, TextInputType.name, Icons.account_box,(v){}),
                SizedBox(height: 20,),
                buildTF("Designation",30, _designationCon, TextInputType.name, Icons.account_box,(v){}),
                SizedBox(height: 20,),
                buildTF("Phone Number",15, _phoneCon, TextInputType.phone, Icons.account_box,(v){}),
                buildBtn("ADD", () {
                    String username = _usernameCon.text.toString().trim();
                    String password = _passwordCon.text.toString().trim();
                    String fullname = _fullNameCon.text.toString().trim();
                    String phone = _phoneCon.text.toString().trim();
                    String designation = _designationCon.text.toString();
                    if(username.isEmpty || username.contains(" ")){
                      showsnackBarMessage("Username is empty or incorrect");
                    }else if(password.isEmpty || password.contains(" ")){
                      showsnackBarMessage("Password is required");
                    }else if(fullname.isEmpty || fullname.contains(" ")){
                      showsnackBarMessage("FullName is required");
                    }else if(phone.isEmpty){
                      showsnackBarMessage("Phone is required");
                    }else if(designation.isEmpty || designation.contains(" ")){
                      showsnackBarMessage("Designation is required");
                    }else {
                      setState(() {
                        User user = new User(userId: 0,username: username,
                            password: password,fullname: fullname,designation: designation,
                            contact: phone);
                        api.createUser(user).then((response) {
                          if(response.statusCode == 200){
                            showsnackBarMessage('Data inserted successfully!');
                            Navigator.pop(context);
                          }else{
                            showsnackBarMessage("Submit data failed!");
                          }
                        });
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container inputField(TextEditingController _controller) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 60,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0x88A6FAFA), Colors.blue[100]],
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(offset: Offset(2, 3), color: Colors.black)]),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,top: 5),
        child: TextField(
          controller: _controller,
          textAlign: TextAlign.start,
          enableSuggestions: true,
          cursorColor: Colors.black,
          cursorWidth: 3,
          cursorHeight: 25,
          maxLength: 20,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Container labels(String name) {
    return Container(
        height: 30,
        width: double.infinity,
        child: Text(
          '$name',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ));
  }

  showsnackBarMessage(String message) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
