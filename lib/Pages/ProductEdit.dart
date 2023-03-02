import 'package:flutter/material.dart';

class ProductEdit extends StatefulWidget {
  const ProductEdit({Key? key}) : super(key: key);

  @override
  State<ProductEdit> createState() => _ProductState();
}

class _ProductState extends State<ProductEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Product"),),
      body: ListView(


        children: [
          Image.asset('lib/images/Tomato.jpeg', width: 200, height: 200),
          const Text("Name: ", style: TextStyle(color: Colors.black),),
          TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          Text("Original Price"),
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            Text("Current Price"),
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            Text("Expiry Date"),
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
        ],
      )
    );
  }
}

