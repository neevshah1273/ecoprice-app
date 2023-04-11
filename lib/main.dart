import 'package:ecoprice/Pages/Cart.dart';
import 'package:ecoprice/Pages/Products.dart';
import 'package:ecoprice/Pages/SignUp.dart';
import 'package:ecoprice/Pages/UserLogin.dart';
import 'package:ecoprice/Pages/WelcomePage.dart';
import 'package:ecoprice/Pages/home.dart';
import 'package:flutter/material.dart';
import 'Pages/ProductEdit.dart';
import 'Pages/ProductAdd.dart';

void main() {


  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  MaterialColor mycolor = const MaterialColor(0xff40513b, <int, Color>{
    50: Color(0xff40513b),
    100: Color(0xff40513b),
    200: Color(0xff40513b),
    300: Color(0xff40513b),
    400: Color(0xff40513b),
    500: Color(0xff40513b),
    600: Color(0xff40513b),
    700: Color(0xff40513b),
    800: Color(0xff40513b),
    900: Color(0xff40513b),
  },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      // theme: ThemeData(
      //   primarySwatch: mycolor,
      //   primaryColor: Color(0xff40513b),
      // ),
      debugShowCheckedModeBanner: false,
      home: Products(),
    );

  }


}
