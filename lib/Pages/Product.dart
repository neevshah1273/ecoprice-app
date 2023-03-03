import 'package:flutter/material.dart';

const double imageWidth = 100;
const double imageHeight = 100;
const double containerWidth = 220;

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          Image.asset('lib/images/Tomato.jpeg'),
          const Center(child: Text("Tomato", style: TextStyle(letterSpacing: 2, fontFamily: 'Light 300'),)),
          const Center(child: Text("10.99 3.99")),
          const Center(child: Text("Expires in x days")),
        ]
      ),
    );
  }
}

