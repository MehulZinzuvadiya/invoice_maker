import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/businessPage.dart';
import 'Screens/customerPage.dart';
import 'Screens/finalBill.dart';
import 'Screens/invoice.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) =>finalbill(),
      // 'customer': (context) => CustomerDetails(),
      // 'invoice':(context) => InvoicePage(),
    },
  ));
}
