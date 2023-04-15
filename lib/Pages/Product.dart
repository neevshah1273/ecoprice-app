import 'package:flutter/material.dart';

const double imageWidth = 100;
const double imageHeight = 100;
const double containerWidth = 220;

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {



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

