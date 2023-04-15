import 'package:ecoprice/Pages/AdminLogin.dart';
import 'package:ecoprice/Pages/Cart.dart';
import 'package:ecoprice/Pages/Products.dart';
import 'package:ecoprice/Pages/SignUp.dart';
import 'package:ecoprice/Pages/UserLogin.dart';
import 'package:ecoprice/Pages/WelcomePage.dart';
import 'package:ecoprice/Pages/home.dart';
import 'package:flutter/material.dart';
import 'Pages/ProductEdit.dart';
import 'Pages/ProductAdd.dart';
import 'Pages/CheckOut.dart';
// import 'Pages/UserLogin.dart';

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

      onGenerateRoute: (settings){
        if(settings.name == '/'){
          return MaterialPageRoute(builder: (context) => WelcomePage());
        }
        if(settings.name == '/signup'){
          return MaterialPageRoute(builder: (context) => SignUp());
        }
        if(settings.name == '/login'){
          return MaterialPageRoute(builder: (context) => UserLogin());

        }
        if(settings.name == '/home'){
          return MaterialPageRoute(builder: (context) => Products());

        }
        if(settings.name == '/addProduct'){
          return MaterialPageRoute(builder: (context) => ProductAdd());
        }
        if(settings.name == '/editProduct'){
          return MaterialPageRoute(builder: (context) => ProductEdit());
        }

        // product/:id
        var uri = Uri.parse(settings.name ?? '');

        if(uri.pathSegments.length == 2 && uri.pathSegments.first == 'product'){

          var id = uri.pathSegments[1];
          //TODO:: Replace this with Product Page
          return MaterialPageRoute(builder: (context) => ProductEdit());

        }
      },

    );

  }


}
