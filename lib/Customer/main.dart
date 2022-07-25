import 'package:flutter/material.dart';
import 'drawer_screen.dart';
import 'search_medicine.dart';

class CustomerMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          MedicineInformation(),
        ],
      ),
    );
  }
}