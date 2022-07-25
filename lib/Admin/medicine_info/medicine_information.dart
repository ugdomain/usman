import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:silkpharma/Login/constant.dart';

class MedicineInfo extends StatefulWidget {
  const MedicineInfo({Key key}) : super(key: key);

  @override
  _MedicineInfoState createState() => _MedicineInfoState();
}

class _MedicineInfoState extends State<MedicineInfo> {
  TextEditingController _medicine;
  String medicine;
  bool isEditingTrue = false;

  @override
  void initState() {
    super.initState();
    _medicine = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _medicine.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Information'),
        centerTitle: true,
      ),
      body: Stack(children: [
        Container(
          height: size.height,
          decoration: boxdecStyle,
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  controller: _medicine,
                  onEditingComplete: () {
                    setState(() {
                      medicine = _medicine.text;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Medicine Name OR Formula',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            medicine = _medicine.text.toString();
                          });
                        },
                      ),
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
            ],
          ),
        ),
      ]),
    );
  }
}