import 'package:ecoprice/models/Cart.dart';
import 'package:ecoprice/models/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Style.dart';

class CounterApp extends StatefulWidget {
  Product product;
  CounterApp(this.product);

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {



  void _incrementCounter(Product product) {
    setState(() {
      Cart.addProductQuantity(product);
    });

  }

  void _decrementCounter(Product product) {

    if(Cart.getProductQuantity(product)>0) {
      setState(() {
        Cart.removeProductQuantity(product);
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    Product product = widget.product;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => _decrementCounter(product),
          child: Icon(Icons.remove, color: Colors.green,),
        ),
        Text(
          Cart.getProductQuantity(product).toString(),
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(fontSize: 5),
            ),
          ),
          // style: TextButton.styleFrom(
          //   fixedSize: Size(10, 10),
          // ),
          onPressed: () => _incrementCounter(product),
          child: Icon(Icons.add, color: Colors.green,),
        ),
      ],
    );
  }
}

// void main() {
//   runApp(CounterApp());
// }



// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// TextButton(
// onPressed: _decrementCounter,
// child: Icon(Icons.remove),
// ),
// Text(
// '$_counter',
// style: GoogleFonts.montserrat(
// fontSize: 20,
// fontWeight: FontWeight.w500,
// ),
// ),
// TextButton(
// style: ButtonStyle(
// textStyle: MaterialStateProperty.all<TextStyle>(
// TextStyle(fontSize: 5),
// ),
// ),
// onPressed: _incrementCounter,
// child: Icon(Icons.add),
// ),
// ],
// ),
