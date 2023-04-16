import 'package:ecoprice/Pages/Style.dart';
import 'package:ecoprice/services/productService.dart';
import 'package:ecoprice/widgets/productGridViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/product.dart';
import 'ItemCounter.dart';
import 'FilterProductDialog.dart';
import 'Product.dart';
import 'ColorGradient.dart';


class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: ColorGradient.getGradient(degree: 140), // Set the gradient
          ),),
        title: Center(child: Text("Buy Now", style: GoogleFonts.montserrat(
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Container(
              padding: EdgeInsets.all(5),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                // color: Colors.blue,
                border: Border.all(color: Colors.black, width: 1.75),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset("lib/images/Tomato.png"),
            ),
            SizedBox(height: 50,),
            Text("Tomato",
              style: GoogleFonts.montserrat(
                color: Color(0xff579a22),
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text("2lbs",
              style: GoogleFonts.montserrat(
                color: Colors.black87,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "\$1.88",
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 20,),
                Text(
                  "\$1.88",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text("Expires In",
              style: GoogleFonts.montserrat(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            Text("5 days",
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            CounterApp(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff579a22), // Set the desired color of the ElevatedButton
                      // You can also customize other properties of the button, such as textStyle, padding, elevation, shape, etc.
                    ),
                    onPressed: (){},
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_sharp),
                        Text("Back", style: GoogleFonts.montserrat(
                          fontSize: 20,
                        ),),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff579a22), // Set the desired color of the ElevatedButton
                      // You can also customize other properties of the button, such as textStyle, padding, elevation, shape, etc.
                    ),
                    onPressed: (){},
                    child: Row(
                      children: [
                        Text("Cart", style: GoogleFonts.montserrat(
                          fontSize: 20,
                        ),),
                        Icon(Icons.arrow_forward_ios_sharp),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      )
    );
  }
}
