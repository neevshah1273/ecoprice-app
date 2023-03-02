import 'package:flutter/material.dart';
import 'package:ecoprice/Pages/Product.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.amber[600],
            width: MediaQuery.of(context).size.width,
            height: 48.0,
            child: const Center(
              child: Text("Products", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          ),
          Product(),
        ],
      ),
    ));
  }
}
