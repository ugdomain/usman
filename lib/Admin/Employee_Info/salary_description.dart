import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:silkpharma/Login/constant.dart';
import 'package:silkpharma/api/controls/user_control.dart';
import 'pay_salary.dart';

class SalaryDesc extends StatefulWidget {
  const SalaryDesc({Key key, this.name, this.id}) : super(key: key);
  final String name;
  final int id;

  @override
  _SalaryDescState createState() => _SalaryDescState();
}

class _SalaryDescState extends State<SalaryDesc> {
  DateTime dateTime;
  var salary,month;
  bool circular = true;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
  }
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    month = DateFormat("MMMM").format(dateTime);
    salary = UserSalaryApiServices().fetchUserSalary(widget.id,'January');
    circular = false;
  }

  @override
  Widget build(BuildContext context) {
    month = DateFormat("MMMM").format(dateTime);
    salary = UserSalaryApiServices().fetchUserSalary(widget.id, month.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x0fff4f4f5),
        iconTheme: IconThemeData(color: Color(0x0ff1c1f22)),
        centerTitle: true,
        title: Text('${widget.name} salary',style: TextStyle(color: Color(0x0ff1c1f22)),),
        textTheme: TextTheme(
            headline1: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,)),

      ),
      body: Container(
        decoration: boxdecStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(3),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Color(0x0ff494c4e)),
                ),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: dateTime,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(dateTime.year + 1),).then((date) => setState(() {
                      if(date != null) dateTime = date;
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Text('Select month',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,),),
                ),
              ),),
            Text('$month  ${dateTime.year}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: 20.0,),
            Expanded(
              child: FutureBuilder(
                future: salary,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data == null ? 1 : snapshot.data.length,
                      itemBuilder: (context,index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 38.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(circular || snapshot.data == null ? 'Total Salary : 0' :'Total Salary : ${snapshot.data[index].salary_amount.toString()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text(circular || snapshot.data == null ? 'Paid Salary : 0' :'Paid Salary : ${snapshot.data[index].salary_paid.toString()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text(circular || snapshot.data == null ? 'Remaining Salary : 0' :'Remaining Salary : ${snapshot.data[index].salary_due.toString()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text(circular || snapshot.data == null ? 'Payment Date : 0' :'Payment Date : ${snapshot.data[index].paying_date.toString()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 30,)
                            ],
                          ),
                        );
                      },
                    );
                  },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0x0ff494c4e),
          foregroundColor: Colors.white,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> PaySalary(id: widget.id)));
          },
          child: Text("Pay",style: TextStyle(fontSize: 15),),
          ),
    );
  }
}
