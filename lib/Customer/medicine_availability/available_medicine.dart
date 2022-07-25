import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silkpharma/Login/constant.dart';

class AvailableMedicine extends StatefulWidget {
  const AvailableMedicine({Key key}) : super(key: key);

  @override
  _AvailableMedicineState createState() => _AvailableMedicineState();
}

class _AvailableMedicineState extends State<AvailableMedicine> {
  TextEditingController _searchCon;
  String medicine,type;
  List<List> _list = [['panadol'.toUpperCase(), 'tablet',  '0']];

  @override
  void initState() {
    super.initState();
    _searchCon = new TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchCon.dispose();
  }

  TextStyle tstyle = TextStyle(fontSize: 15,fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Medicine'),
        centerTitle: true,
      ),
      body: Container(
        decoration: boxdecStyle,
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.9,
              height: size.height * .1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(colors: [
                    Colors.blue.withOpacity(.2),
                    Colors.blue.withOpacity(.2)
                  ])),
              child: TextField(
                controller: _searchCon,
                onEditingComplete: (){
                  setState(() {
                  medicine = _searchCon.text.toUpperCase();
                });},
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search for Medicine',
                    hintStyle: TextStyle(
                        fontSize: 15,
                        wordSpacing: 7,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
                decoration: boxdecStyle,
                width: size.width * .9,
                height: size.height*.23,
                child: ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return
                      (medicine == _list[index][0])?
                      Container(
                        width: size.width * .7,
                        height: size.height * .5,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              Row(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                child: Text('Medicine Name :',style: tstyle,),
                              ),
                              SizedBox(width: 23,),
                              Text('$medicine',style: tstyle,)
                            ],
                            ),
                            SizedBox(height: 20,),
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25),
                                child: Text('Medicine Type :',style: tstyle,),
                              ),
                              SizedBox(width: 20,),
                              Text('${_list[index][1]}',style: tstyle,)
                            ],
                            ),
                            SizedBox(height: 20,),
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                child: Text('Available Medicine :',style: tstyle,),
                              ),
                              Text('${_list[index][2]}',style: tstyle,)
                            ],
                            ),
                          ],
                        ),
                      ):Text('')
                    ;
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}