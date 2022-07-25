import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silkpharma/Admin/Employee_Info/configuration.dart';
import 'package:silkpharma/Login/constant.dart';
import 'package:silkpharma/api/controls/user_control.dart';
import 'package:silkpharma/api/models/userModel.dart';

var _scaffoldState = GlobalKey<ScaffoldState>();

class EditEmployee extends StatefulWidget {
  int id;
  String designation, username, password, fullname, phone, userPic;

  EditEmployee(
      {Key key,
      this.id,
      this.username,
      this.password,
      this.fullname,
      this.designation,
      this.phone,
      this.userPic})
      : super(key: key);

  @override
  _EditEmployeeState createState() => _EditEmployeeState(this.id, this.username,
      this.password, this.fullname, this.designation, this.phone);
}

class _EditEmployeeState extends State<EditEmployee> {
  _EditEmployeeState(this.id, this.username, this.password, this.fullname,
      this.designation, this.phone);

  int id;
  String designation, username, password, fullname, phone;

  TextEditingController _usernameCon = new TextEditingController();
  TextEditingController _passwordCon = new TextEditingController();
  TextEditingController _fullNameCon = new TextEditingController();
  TextEditingController _designationCon = new TextEditingController();
  TextEditingController _phoneCon = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameCon.dispose();
    _passwordCon.dispose();
    _fullNameCon.dispose();
    _designationCon.dispose();
    _phoneCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _usernameCon.text = username;
    _passwordCon.text = password;
    _fullNameCon.text = fullname;
    _designationCon.text = designation;
    _phoneCon.text = phone;
    UserAPIServices api = new UserAPIServices();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Employee',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      key: _scaffoldState,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: boxdecStyle,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTF("User Name",30, _usernameCon, TextInputType.name,
                  Icons.account_box, (text) {
                username = _usernameCon.text;
              }),
              SizedBox(
                height: 20,
              ),
              buildTF("Password",30, _passwordCon, TextInputType.visiblePassword,
                  Icons.account_box, (text) {
                password = _passwordCon.text;
              }),
              SizedBox(
                height: 20,
              ),
              buildTF("Full Name",30, _fullNameCon, TextInputType.name,
                  Icons.account_box, (text) {
                fullname = _fullNameCon.text;
              }),
              SizedBox(
                height: 20,
              ),
              buildTF("Designation",30, _designationCon, TextInputType.number,
                  Icons.account_box, (text) {
                designation = _designationCon.text;
              }),
              SizedBox(
                height: 20,
              ),
              buildTF("Phone Number",15, _phoneCon, TextInputType.phone,
                  Icons.account_box, (text) {
                phone = _phoneCon.text;
              }),
              buildBtn(
                "Edit",
                () {
                  String username = _usernameCon.text.toString().trim();
                  String password = _passwordCon.text.toString().trim();
                  String fullName = _fullNameCon.text.toString().trim();
                  String phone = _phoneCon.text.toString().trim();
                  String designation = _designationCon.text.toString();
                  if (username.isEmpty) {
                    showsnackBarMessage("Username is required");
                  } else if (password.isEmpty) {
                    showsnackBarMessage("Password is required");
                  } else if (fullName.isEmpty) {
                    showsnackBarMessage("Name is required");
                  } else if (phone.isEmpty) {
                    showsnackBarMessage("Phone is required");
                  } else if (designation.isEmpty) {
                    showsnackBarMessage("Designation is required");
                  } else {
                    setState(() {
                      User user = new User(
                          userId: widget.id,
                          username: username,
                          password: password,
                          fullname: fullName,
                          designation: designation,
                          contact: phone);
                      api.updateUser(user).then((response) {
                        if (response.statusCode == 200) {
                          showsnackBarMessage('Data updated successfully!');
                          Navigator.pop(context);
                        } else {
                          showsnackBarMessage("Edit data failed!");
                          print("error : " + response.statusCode.toString());
                        }
                      });
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  showsnackBarMessage(String message) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));
}
