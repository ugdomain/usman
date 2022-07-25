import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silkpharma/Admin/Employee_Info/employee_description.dart';
import 'package:silkpharma/Login/main_login_page.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Roboto-Regular.ttf'),
    debugShowCheckedModeBanner: false,
    home:
    splashHome(),
  ));

}

class splashHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 100,
              child: Shimmer.fromColors(
                  baseColor: Colors.lightGreenAccent[100],
                  highlightColor: Colors.red,
                  child: Column(
                    children: [
                      Text(
                        'Silk Pharma',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  )),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/SP.png',scale: 2,fit: BoxFit.cover,)),
            Container(
              height: 250,
              child: SplashScreen(
                seconds: 5,
                backgroundColor: Colors.black,
                loaderColor: Colors.lightGreenAccent[100],
                navigateAfterSeconds: MainLoginPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
