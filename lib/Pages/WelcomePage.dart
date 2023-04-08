import 'dart:ffi';

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {

  // double screenWidth = MediaQuery.of(context).size.width;

  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff40513b),
        title: Center(
          child: Text("Welcome to Eco-Price"),
        )
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(50),
            child: Image.asset('lib/images/image33.png',
                width: 200,
                height: 200),
          ),
          Container(
            child: Center(
              child: Text("EcoPrice",
              style: TextStyle(color: Color(0xff40513b),
              fontWeight: FontWeight.bold,
              fontSize: 48),),
            ),
            padding: EdgeInsets.all(20),
          ),
          Container(
            child: Center(
              child: Text("Minimum Wastage",
              style: TextStyle(color: Color(0xff609966),
                  fontSize: 24),),
            ),
          ),
          Container(
            child: Center(
              child: Text("Maximum Savings", 
              style: TextStyle(color: Color(0xff609966),
              fontSize: 24),)
            ),
          ),
          Padding(
              padding: EdgeInsets.all(60),
            child: Container(
                width: 10,
              child: FilledButton(
                style: FilledButton.styleFrom(backgroundColor: Color(0xff40513B)),
                onPressed: (){},
                child: Text("GET STARTED"),
              ),
            ),
          ),

        ],
      )
      );
    // );
  }
}
