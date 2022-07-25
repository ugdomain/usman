import 'package:flutter/material.dart';
import 'daily_profit_loss.dart';
import 'monthly_profit_loss.dart';

class ProfitLoss extends StatefulWidget {
  const ProfitLoss({Key key}) : super(key: key);

  @override
  _ProfitLossState createState() => _ProfitLossState();
}

class _ProfitLossState extends State<ProfitLoss> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profit Loss Report'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            labelPadding: EdgeInsets.symmetric(horizontal: 35),
            indicatorColor: Colors.black,
            indicatorWeight: 4,
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:15),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Daily',
                    style: TextStyle(fontSize: 18,),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Monthly',
                    style: TextStyle(fontSize: 18,),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          DailyProfitLoss(),
          MonthlyProfitLoss(),
        ]
        ),
      ),
    );
  }
}
