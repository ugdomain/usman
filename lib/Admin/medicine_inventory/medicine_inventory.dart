import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silkpharma/Login/constant.dart';
import 'package:silkpharma/api/controls/medicine_inventory_controller.dart';

import 'inventory_detail.dart';

class MedicineInventory extends StatefulWidget {
  const MedicineInventory({Key key}) : super(key: key);


  @override
  _MedicineInventoryState createState() => _MedicineInventoryState();
}

class _MedicineInventoryState extends State<MedicineInventory> {
  String valueChoose = "SYRUP";
  List listItem = [
    'EYE DROPS','BALM','CAP','CARTGE','CREAM','DROPS','FACEWASH','GEL',
    'INFUSION','INHALER','INJ','LOTION','LOZENGES','MOUTHWASH','OIL',
    'OINTMENT','OVULES','PASTE','PEN','SACHET','SHAMPOO','SOAP','SOLUTION',
    'SPRAY','SUPPOSITORIES','SUSPENSION','SYRUP','TAB','TOOTHPASTE','TUBE',
    'VACCINE'
  ];
  var medicine = '';
  var _medicine = new TextEditingController();
  var inventory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inventory = InventoryApiService();
  }

  @override
  Widget build(BuildContext context) {
    inventory = InventoryApiService();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Medicine Inventory',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: boxdecStyle,
        child: Column(children: [
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
                  maxLength: 30,
                  controller: _medicine,
                  onEditingComplete: () {
                    setState(() {
                      medicine = _medicine.text;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Medicine Name',
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
              child: DropdownButton(
                hint: Text('Select type',),
                dropdownColor: Colors.white,
                isExpanded: true,
                value: valueChoose,
                onChanged: (newValue){
                  setState(() {
                    valueChoose = newValue;
                  });
                },
                items: listItem.map((valueItem){
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem,style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: inventory.fetchMedicineInventory(medicine != null ? medicine : ""),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data == null ? 1 : snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                    if(snapshot.hasData){
                    var product = snapshot.data[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (product.type_name.toString().trim() == valueChoose.toLowerCase() && valueChoose == "Syringe")
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.all(20.0),
                          color: Colors.blueAccent.withOpacity(0.75),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MedicineInventoryDetail(
                                    type: product.type_name,
                                    productName: product.product,
                                    quantity: product.quantity,
                                    supplier: product.supplier,
                                    purchasePrice: product.purchase_price,
                                    purchaseDate: product.purchaseDate,
                                    mfgDate: product.mfg_date,
                                    expDate: product.exp_date,
                                  )));
                            },
                            child: Row(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
                                child: Image.asset(
                                  'assets/Drugs/syringe.jpg',
                                  scale: 6,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Syringe : ${snapshot.data[index].product.toString()}',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 40,),
                              Text(snapshot.data[index].Batch_No.toString(),style: TextStyle(color: Colors.white),)
                            ]),
                          ),
                        ),
                      if (snapshot.data[index].type_name.toString().trim() == valueChoose.toLowerCase() && valueChoose == "Syrup")
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.all(20.0),
                          color: Colors.white,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MedicineInventoryDetail(
                                    type: product.type_name,
                                    productName: product.product,
                                    quantity: product.quantity,
                                    supplier: product.supplier,
                                    purchasePrice: product.purchase_price,
                                    purchaseDate: product.purchaseDate,
                                    mfgDate: product.mfg_date,
                                    expDate: product.exp_date,
                                  )));
                            },
                            child: Row(
                                children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
                                child: Image.asset(
                                  'assets/Drugs/syrup.jpg',
                                  scale: 6,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(width: 20,),
                              Text(
                                'Syrup : ${snapshot.data[index].product.toString()}',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                                  SizedBox(width: 40,),
                              Text(snapshot.data[index].Batch_No.toString(),style: TextStyle(color: Colors.black),)
                            ]),
                          ),
                        ),
                      if (snapshot.data[index].type_name.toString().trim() == valueChoose.toLowerCase() && valueChoose == "Tablet")
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.all(20.0),
                          color: Colors.white,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MedicineInventoryDetail(
                                    type: product.type_name,
                                    productName: product.product,
                                    quantity: product.quantity,
                                    supplier: product.supplier,
                                    purchasePrice: product.purchase_price,
                                    purchaseDate: product.purchaseDate,
                                    mfgDate: product.mfg_date,
                                    expDate: product.exp_date,
                                  )));
                            },
                            child: Row(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
                                child: Image.asset(
                                  'assets/Drugs/tablets.jpg',
                                  scale: 6,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(width: 20,),
                              Text(
                                'Tablets : ${snapshot.data[index].product.toString()}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 40,),
                              Text(snapshot.data[index].Batch_No.toString(),style: TextStyle(color: Colors.black),)
                            ]),
                          ),
                        ),
                      if (snapshot.data[index].type_name.toString().trim() == valueChoose.toLowerCase() && valueChoose == "Gel")
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.all(20.0),
                          elevation: 14,
                          color: Colors.white,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MedicineInventoryDetail(
                                    type: product.type_name,
                                    productName: product.product,
                                    quantity: product.quantity,
                                    supplier: product.supplier,
                                    purchasePrice: product.purchase_price,
                                    purchaseDate: product.purchaseDate,
                                    mfgDate: product.mfg_date,
                                    expDate: product.exp_date,
                                  )));
                            },
                            child: Row(children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                  child: Image.asset(
                                    'assets/Drugs/Medicine-Gel.jpg',
                                    scale: 12.0,
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(width: 20,),
                              Text(
                                'Gel : ${snapshot.data[index].product.toString()}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 40,),
                              Text(snapshot.data[index].Batch_No.toString(),style: TextStyle(color: Colors.black),)
                            ]),
                          ),
                        ),
                      if (snapshot.data[index].type_name.toString().trim().toLowerCase() == valueChoose.toLowerCase())
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.all(20.0),
                          elevation: 14,
                          color: Colors.white,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MedicineInventoryDetail(
                                    type: product.type_name,
                                    productName: product.product,
                                    quantity: product.quantity,
                                    supplier: product.supplier,
                                    purchasePrice: product.purchase_price,
                                    purchaseDate: product.purchaseDate,
                                    mfgDate: product.mfg_date,
                                    expDate: product.exp_date,
                                  )));
                            },
                            child: Row(children: [

                              Text(
                                'EYE DROP : ${snapshot.data[index].product.toString()}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 40,),
                              Text(snapshot.data[index].Batch_No.toString(),style: TextStyle(color: Colors.black),)
                            ]),
                          ),
                        ),
                    ],
                  );
                }else{
                      return Center(
                          child: CircularProgressIndicator(value: 20,color: Colors.black,)
                      );
                    }});
              },
              ),
          ),
        ]),
      ),
    );
  }
}
