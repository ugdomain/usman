import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:silkpharma/Login/constant.dart';
import 'package:silkpharma/api/controls/profit_controller.dart';


class MonthlyProfitLoss extends StatefulWidget {
  const MonthlyProfitLoss({Key key}) : super(key: key);

  @override
  _MonthlyProfitLossState createState() => _MonthlyProfitLossState();
}

class _MonthlyProfitLossState extends State<MonthlyProfitLoss> {
  var profit,month,year;
  bool circular = true;
  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    month = _dateTime.month;
    year = _dateTime.year;
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    profit = new ProfitApiServices().fetchMonthlyProfit(month.toString(),year.toString());
    circular = false;
  }

  @override
  Widget build(BuildContext context) {
    month = _dateTime.month;
    year = _dateTime.year;
    profit = new ProfitApiServices().fetchMonthlyProfit(month.toString(),year.toString());
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
              child: Text(month!=null && year != null ? '$month - $year':'',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20,),
          //Text(profit.toString()),
          Expanded(
            flex: 1,
            child: FutureBuilder(
              future: profit,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder:(context,index){
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        height: size.height * .1,
                        decoration: boxdecStyle,
                        child: Row(
                          children: [
                            Text(circular || snapshot.hasError|| snapshot.data[index].profit == null?'Total Profit :  Rs.0.00': double.parse(snapshot.data[index].profit) < 0 ?
                            'Total Loss : Rs.${double.parse(snapshot.data[index].profit)*-1}':
                            'Total Profit : Rs.${snapshot.data[index].profit.toString()}',
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );}
                );
              },),
          ),],
      ),
    );
  }
}
