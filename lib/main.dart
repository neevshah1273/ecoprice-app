import 'package:ecoprice/Pages/Login.dart';
import 'package:ecoprice/Pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Pages/ProductEdit.dart';
import 'Pages/Product.dart';
import 'Pages/Products.dart';
import 'Pages/AdminLogin.dart';

void main() {
  runApp(
       MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Products(),
  ));
}
