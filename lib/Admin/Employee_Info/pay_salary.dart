import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:silkpharma/Login/constant.dart';
import 'package:silkpharma/api/controls/user_control.dart';
import 'package:silkpharma/api/models/userModel.dart';

class PaySalary extends StatefulWidget {
  PaySalary({Key key,this.id}) : super(key: key);
  final int id;
  @override
  _State createState() => _State();
}

class _State extends State<PaySalary> {

  double total,pay,due;

  TextEditingController totalAmountCon = TextEditingController();
  TextEditingController payAmountCon = TextEditingController();
  TextEditingController paymentMonthCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    setState(() {
      if(totalAmountCon.text.isNotEmpty && payAmountCon.text.isNotEmpty){
      total = double.parse(totalAmountCon.text);
      pay = double.parse(payAmountCon.text);}
    });
    var api = UserSalaryApiServices();
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay Salary",style: TextStyle(color: Color(0x0ff1c1f22)),),
        centerTitle: true,
        backgroundColor: Color(0x0fff4f4f5),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: boxdecStyle,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                buildTF(
                    TextField(
                      maxLength: 7,
                      controller: totalAmountCon,
                      decoration: InputDecoration(hintText: "Enter total salary or remaining (if any)",border: InputBorder.none),
                      keyboardType: TextInputType.number,
                      onEditingComplete: (){total = double.parse(totalAmountCon.text);},
                    )
                ),
                buildTF(TextField(controller: payAmountCon,onEditingComplete: (){},
                  maxLength: 7,
                  decoration: InputDecoration(hintText: "Enter salary payment amount",border: InputBorder.none),
                  keyboardType: TextInputType.number,),),
                buildTF(TextField(controller: paymentMonthCon,
                  maxLength: 10,
                  onEditingComplete: (){pay = double.parse(payAmountCon.text);},
                  decoration: InputDecoration(hintText: "Enter salary month(in words)",border: InputBorder.none),
                  keyboardType: TextInputType.text,),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(child: Text("Save"),onPressed: (){
                      double totalAmount = double.parse(totalAmountCon.text.trim());
                      double payAmount = double.parse(payAmountCon.text.trim());
                      String paymentMonth = paymentMonthCon.text.toString().toLowerCase().trim();
                      if(totalAmount == null){
                        showsnackBarMessage("Total amount is required");
                      }else if(payAmount == null){
                        showsnackBarMessage("Salary payment amount is required");
                      }else if(paymentMonth.isEmpty){
                        showsnackBarMessage("Name is required");
                      }else {
                        setState(() {
                          if(total != null && pay != null)
                            due = total - pay;
                          UserSalary userSalary = new UserSalary(user_id: widget.id,salary_amount: total,
                          salary_paid: payAmount,salary_due: due,salary_month: paymentMonth,paying_date: DateFormat.yMMMd().format(DateTime.now()));
                          api.createUserSalary(userSalary).then((response) {
                            if(response.statusCode == 200){
                              showsnackBarMessage('Data inserted successfully!');
                              Navigator.pop(context);
                            }else{
                              showsnackBarMessage("Submit data failed!");
                            }
                          });
                        });
                      }
                    },style: ButtonStyle(elevation: MaterialStateProperty.all(3),
                      backgroundColor: MaterialStateProperty.all(Color(0x0ff494e4c)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 40)),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildTF(TextField tf) {
    return Container(
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
                  child: tf,
                ),
              ),
    );
  }
showsnackBarMessage(String message) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
