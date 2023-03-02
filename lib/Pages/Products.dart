import 'package:flutter/material.dart';
import 'Product.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("PRODUCTS"), centerTitle: true, actions: [ElevatedButton(onPressed: null, child
            : Text("Add", style: TextStyle(color: Colors.black),))],),
        body: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 6.0, mainAxisSpacing: 6.0), children: [
          Product(),
          Product(),
          Product(),
          Product(),
          Product(),
          Product(),
        ],),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Row(
            children: const [
              IconButton(onPressed: null, icon: Icon(Icons.navigate_before)),
              IconButton(onPressed: null, icon: Icon(Icons.home)),
              IconButton(onPressed: null, icon: Icon(Icons.navigate_next)),
            ],
          ),
        ),
    ));
  }
}


