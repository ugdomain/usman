import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:silkpharma/Login/constant.dart';
import 'package:silkpharma/api/controls/purchase_controller.dart';
import 'package:silkpharma/api/controls/sales_controller.dart';


class DailySellPurchase extends StatefulWidget {
  const DailySellPurchase({Key key}) : super(key: key);

  @override
  _DailySellPurchaseState createState() => _DailySellPurchaseState();
}

class _DailySellPurchaseState extends State<DailySellPurchase> {

  var totalPurchase,totalSale;
  var date;
  bool circular = true;
  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    totalPurchase = PurchaseAPIServices().fetchDailyPurchase(date);
    totalSale = SaleApiService().fetchDailySale(date);
    circular = false;
  }

  @override
  Widget build(BuildContext context) {
    String _date = DateFormat("yyyy-MM-dd").format(_dateTime);
    date = DateFormat.yMMMMd().format(_dateTime);
    totalPurchase = PurchaseAPIServices().fetchDailyPurchase(_date);
    totalSale = SaleApiService().fetchDailySale(_date);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: size.width,
      height: size.height,
      decoration: boxdecStyle,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0x0ff494c4e)),
                visualDensity: VisualDensity(horizontal: 2,vertical: 2)
            ),
            onPressed: (){
              showDatePicker(
                context: context,
                initialDate: _dateTime,
                firstDate: DateTime(1990),
                lastDate: DateTime(_dateTime.year + 1),
              ).then((date) =>
                  setState(() {
                    if(date != null)
                      _dateTime = date;
                  }));
            },
            child: Text('Select Date',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
          ),
          SizedBox(height: 20,),
          Container(
            decoration: boxdecStyle,
            height: size.height * .1,
            child: Center(
              child: Text(date!=null?date:'',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            flex: 1,
            child: FutureBuilder(
              future: totalPurchase,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder:(context,index){
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: size.height * .1,
                        decoration: boxdecStyle,
                        child: Row(
                          children: [
                            Text(circular || snapshot.hasError || snapshot.data[index].TotalPrice == null?'Total Purchase :  0':'Total Purchase : Rs.${snapshot.data[index].TotalPrice.toString()}',
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                          ],),
                      );}
                );
              },),
          ),
          Expanded(
            flex: 3,
            child: FutureBuilder(
              future: totalSale,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder:(context,index){
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: size.height * .1,
                        decoration: boxdecStyle,
                        child: Row(
                          children: [
                            Text(circular || snapshot.hasError || snapshot.data[index].TotalPrice == null?'Total Sale :  0':'Total Sale : Rs.${snapshot.data[index].TotalPrice.toString()}',
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                          ],),
                      );}
                );
              },),
          ),
        ],
      ),
    );
  }
}
