import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silkpharma/Admin/supplier_info/supplier_details.dart';
import 'package:silkpharma/Admin/supplier_info/supplier_page_constant.dart';
import 'package:silkpharma/Login/constant.dart';
import 'package:silkpharma/api/controls/supplier_controller.dart';

var _scaffoldState = GlobalKey<ScaffoldState>();

class SupplierInfoMain extends StatefulWidget {
  const SupplierInfoMain({Key key}) : super(key: key);

  @override
  _SupplierInfoMainState createState() => _SupplierInfoMainState();
}

class _SupplierInfoMainState extends State<SupplierInfoMain> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var supplierApi = SupplierAPIServices();
    return Scaffold(
        key: _scaffoldState,
        appBar: AppBar(
          title: Text('Supplier Information'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Container(
          width: size.width,
          decoration: boxdecStyle,
          padding: EdgeInsets.all(20),
          child: FutureBuilder(
            future: supplierApi.fetchSupplier(),
            builder: (context, snapshot) => snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, int index) {
                      var _supplier = snapshot.data[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 18),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.blueGrey[100],
                            elevation: 3,
                            child: Container(
                              width: size.width * .8,
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SupplierDetails(
                                            id: _supplier.supplier_id,
                                            code: _supplier.supplier_code,
                                            address: _supplier.supplier_address,
                                            state: _supplier.supplier_state,
                                            phone: _supplier.supplier_contact,
                                            country: _supplier.supplier_country,
                                            name: _supplier.supplier_name,
                                            email: _supplier.supplier_email,
                                          )));
                                },
                                child: Expanded(
                                    child: ListTile(
                                        title: Text(
                                  '${_supplier.supplier_name}',
                                  style: textStyle,
                                ))),
                              ),
                            )),
                      );
                    })
                : Center(
                    child: Transform.scale(
                      scale: 1,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  ),
          ),
        )
    );
  }
}
