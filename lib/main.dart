import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/businessPage.dart';
import 'Screens/customerPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => BuisnessDetails(),
      'customer': (context) => CustomerDetails(),
    },
  ));
}