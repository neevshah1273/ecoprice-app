<<<<<<< HEAD
import 'package:ecoprice/Pages/Login.dart';
import 'package:ecoprice/Pages/home.dart';
import 'package:flutter/foundation.dart';
=======
import 'package:ecoprice/Pages/UserLogin.dart';
>>>>>>> 61175f8 (Implemented UI of SignUp, ProductEdit, Login and WelcomePage)
import 'package:flutter/material.dart';
import 'Pages/ProductEdit.dart';
import 'Pages/Product.dart';
import 'Pages/Products.dart';
import 'Pages/AdminLogin.dart';
import 'Pages/WelcomePage.dart';
import 'Pages/UserLogin.dart';
import 'Pages/SignUp.dart';

void main() {

  runApp(MaterialApp(
    // theme: ThemeData(
    //   primarySwatch: MaterialColor(primary, swatch),
    // ),
    debugShowCheckedModeBanner: false,
    home: ProductEdit(),
  ));
}
