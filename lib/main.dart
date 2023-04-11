
import 'package:flutter/material.dart';
import 'Pages/ProductEdit.dart';

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


      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      debugShowCheckedModeBanner: false,
      home: ProductEdit(),
    );

  }

}
