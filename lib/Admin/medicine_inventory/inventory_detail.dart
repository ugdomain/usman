import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silkpharma/Login/constant.dart';
import 'package:silkpharma/api/controls/medicine_inventory_controller.dart';

class MedicineInventoryDetail extends StatelessWidget {
  const MedicineInventoryDetail({Key key, this.type, this.quantity, this.productName, this.supplier, this.purchasePrice, this.purchaseDate, this.mfgDate, this.expDate})
      : super(key: key);

  final String type,productName,supplier,purchaseDate,mfgDate,expDate;
  final double purchasePrice,quantity;

  @override
  Widget build(BuildContext context) {
    var inventory = InventoryApiService();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Details'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          // width: double.infinity,
          height: size.height,
          decoration: boxdecStyle,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildRow(context,'Product Name', productName),
                buildRow(context,'Type', type),
                buildRow(context,'Supplier', supplier),
                buildRow(context,'Price', purchasePrice.toString()),
                buildRow(context,'Stock', quantity.toString()),
                buildRow(context,'Purchase Date', purchaseDate),
                buildRow(context,'Mfg Date', mfgDate),
                buildRow(context,'Expiry Date', expDate),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildRow(BuildContext context,String type, String detail) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
            color: Colors.white,
            child: Container(
                width: size.width * 0.40,
                height: 40,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12,horizontal: 4),
                    child: Text(
                  type == null ? '' : '$type'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    wordSpacing: 2,
                    letterSpacing: 2
                  ),
                )))),
        Card(
          color: Colors.white,
          child: Container(
            width: size.width * 0.5,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
              child: Text(
                detail == null ? '' : '$detail'.toUpperCase(),
                style: TextStyle(
                    color: Colors.black,
                    wordSpacing: 2,
                    letterSpacing: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
