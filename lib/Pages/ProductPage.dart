import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/product.dart';
import '../models/user.dart';
import 'Cart.dart';
import 'ItemCounter.dart';
import 'ColorGradient.dart';
import 'dart:typed_data';
import 'Products.dart';
import 'dart:convert';


class ProductPage extends StatefulWidget {
  Product product;
  User user;
  ProductPage(this.product, this.user ,{Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  dynamic getImage(String encoded) {
    Uint8List bytes = base64.decode(encoded.split(',').last);
    return bytes;
  }


  @override
  Widget build(BuildContext context) {

    Product product = widget.product;
    User user = widget.user;

    void navigateCart() {
      //TODO::
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CartPage(user)),
              (route) => false);
    }

    void navigateHome(){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Products(user)),
              (route) => false
      );
    }
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(5),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  // color: Colors.blue,
                  border: Border.all(color: Colors.black, width: 1.75),
                  borderRadius: BorderRadius.circular(10),
                ),
                //TODO:: Change
                child: Image.asset("lib/images/${product.title}.png", width: 75, height: 75,),
              ),
              SizedBox(height: 50,),
              Text("${product.title}",
                style: GoogleFonts.montserrat(
                  color: Color(0xff579a22),
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("\$ ${product.currentPrice}",
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text(
                    "\$ ${product.originalPrice}",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text("Expires In",
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
              Text("${product.dueDate} days",
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              CounterApp(product),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff579a22), // Set the desired color of the ElevatedButton
                        // You can also customize other properties of the button, such as textStyle, padding, elevation, shape, etc.
                      ),
                      onPressed: (){
                        navigateHome();
                      },
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff579a22), // Set the desired color of the ElevatedButton
                      // You can also customize other properties of the button, such as textStyle, padding, elevation, shape, etc.
                    ),
                    onPressed: (){
                      navigateCart();
                    },
                    child: Row(
                      children: [
                        Text("Cart", style: GoogleFonts.montserrat(
                          fontSize: 20,
                        ),),
                        Icon(Icons.arrow_forward_ios_sharp),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
