import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'daily_sell_purchase.dart';
import 'monthly_sell_purchase.dart';
import 'unit_details.dart';

class SellPurchaseMain extends StatefulWidget {
  const SellPurchaseMain({Key key}) : super(key: key);

  @override
  _SellPurchaseMainState createState() => _SellPurchaseMainState();
}

class _SellPurchaseMainState extends State<SellPurchaseMain> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Sell Purchase Report'),
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              labelPadding: EdgeInsets.all(7),
              indicatorColor: Colors.black,
              indicatorWeight: 4,
              tabs: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                          'Unit Details',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                          'Daily',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                          'Monthly',
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
              unitDetails(),
            DailySellPurchase(),
          MonthlySellPurchase(),
        ]
          ),
        ),
    );
  }
}
