import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silkpharma/Admin/main_page/Admin.dart';
import 'package:silkpharma/Customer/main.dart';
import 'package:silkpharma/api/controls/user_control.dart';
import 'constant.dart';
import 'sharedPreferences/models.dart';
import 'sharedPreferences/preferences_services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _preferencesServices = PreferenceServices();
  bool _rememberMe = false;
  var user,_username,_password;
  final userCon = new TextEditingController();
  final passCon = new TextEditingController();

  _populateFields()async{
    final settings = await _preferencesServices.getSettings();
    setState(() {
      userCon.text = settings.name;
      passCon.text = settings.password;
    });
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: LabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: textBoxDecStyle,
          height: 60.0,
          child: TextField(
            controller: userCon,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              hintText: 'Enter your Email',
              hintStyle: HintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  bool isPasswordHidden = true;
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: LabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: textBoxDecStyle,
          height: 60.0,
          child: TextField(
            controller: passCon,
            obscureText: isPasswordHidden,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              hintText: 'Enter your Password',
              hintStyle: HintTextStyle,
              suffixIcon: InkWell(
                onTap: _onTapHidePassword,
                child: !isPasswordHidden?Icon(Icons.visibility):Icon(Icons.visibility_off),
              )
            ),
          ),
        ),
      ],
    );
  }

  void _onTapHidePassword(){
    setState(() {
      isPasswordHidden = !isPasswordHidden;
    });
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                  _saveSettings();
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: LabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn(String username,String password) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: (){
          setState(() {
            if(userCon.text == username && passCon.text == password && username != "" && password != ""){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AdminPanel()));}
            else if(userCon.text == '' && passCon.text == ''){
              showsnackBarMessage("Required Username and Password");}
            else{
              showsnackBarMessage("Username or Password is incorrect, Try again or contact to developer.");}
          });
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: BtnTextColor,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xABE7E7F1),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  _saveSettings(){
    final newSetting = Settings(
      name: userCon.text,
      password: passCon.text,
    );
    _preferencesServices.saveSettings(newSetting);
  }

  @override
  void initState() {
    super.initState();
    _populateFields();
    user = UserAPIServices().fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    user = UserAPIServices().fetchUser() == null ? '': UserAPIServices().fetchUser();
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: boxdecStyle,
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Silk Pharma',
                        style: TextStyle(
                          color: BtnTextColor,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: BtnTextColor,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FutureBuilder(
                      future: user,
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                            _username = snapshot.hasError || snapshot.data == null ? "":snapshot.data[0].username.toString();
                            _password = snapshot.hasError || snapshot.data == null ? "": snapshot.data[0].password.toString();
                        return Container();
                      }) ,
                      SizedBox(height: 20.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      SizedBox(height: 6,),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(_username,_password),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  showsnackBarMessage(String message) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}