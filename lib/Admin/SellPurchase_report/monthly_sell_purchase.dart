import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:silkpharma/Login/constant.dart';
import 'package:silkpharma/api/controls/purchase_controller.dart';
import 'package:silkpharma/api/controls/sales_controller.dart';


class MonthlySellPurchase extends StatefulWidget {
  const MonthlySellPurchase({
    Key key,
  }) : super(key: key);

  @override
  State<MonthlySellPurchase> createState() => _MonthlySellPurchaseState();
}

class _MonthlySellPurchaseState extends State<MonthlySellPurchase> {

  var totalSale,totalPurchase,month,year;
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
    totalSale = SaleApiService().fetchMonthlySale(month);
    totalPurchase = PurchaseAPIServices().fetchMonthlyPurchase(month);
    circular = false;
  }

  @override
  Widget build(BuildContext context) {
    int _month = _dateTime.month;
    month = DateFormat.MMMM().format(_dateTime);
    year = DateFormat.y().format(_dateTime);
    totalPurchase = PurchaseAPIServices().fetchMonthlyPurchase(_month);
    totalSale = SaleApiService().fetchMonthlySale(_month);
    Size size = MediaQuery.of(context).size;
    return Container(
          padding: EdgeInsets.all(20),
          width: size.width,
        height: size.height,
        decoration: boxdecStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                child: Text('Select Month',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
            Container(
              decoration: boxdecStyle,
              height: size.height * .1,
              child: Center(
                child: Text(month!=null?'$month $year':'',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
            ),
           Expanded(
             child: FutureBuilder(
               future: totalPurchase,
                 builder: (context,snapshot){
                 return ListView.builder(
                   itemCount: 1,
                     itemBuilder: (context,index){
                       return  Container(
                         padding: EdgeInsets.symmetric(horizontal: 10),
                         height: size.height * .1,
                         decoration: boxdecStyle,
                         child: Row(
                           children: [
                             circular || snapshot.hasError || snapshot.data[index].TotalPrice == null?
                             Text("Total Purchase : \t 0",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),):
                             Text('Total Purchase : \t ${snapshot.data[index].TotalPrice}',
                               style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                             ),
                           ],
                         ),
                       );}
                 );}
             ),
           ),
            Expanded(
              child: FutureBuilder(
                future: totalSale,
                  builder: (context,snapshot){
                    return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context,index){
                      return  Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: size.height * .1,
                        decoration: boxdecStyle,
                        child: Row(
                          children: [
                            circular || snapshot.hasError || snapshot.data[index].TotalPrice == null ?
                            Text("Total Purchase :   0",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)):
                            Text('Total Sale :  0',
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    });
                  }),
            )
          ],
        ),
    );
  }
}
