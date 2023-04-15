import 'package:ecoprice/Pages/Style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Product.dart';
import 'ColorGradient.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient:
                  ColorGradient.getGradient(degree: 140), // Set the gradient
            ),
          ),
          title: Center(
            child: Text(
              "Check Out",
              style: GoogleFonts.montserrat(),
            ),
          )),
      body: Column(),
    );
  }
}
