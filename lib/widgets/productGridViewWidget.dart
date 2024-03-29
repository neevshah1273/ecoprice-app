import 'dart:convert';
import 'dart:typed_data';
import 'package:ecoprice/Pages/ProductEdit.dart';

import '../Pages/ItemCounter.dart';


import 'package:ecoprice/models/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductGridViewWidget extends StatefulWidget {
  Product product;

  bool isAdmin;
  ProductGridViewWidget(this.product, this.isAdmin, {super.key});


  @override
  State<ProductGridViewWidget> createState() => _ProductGridViewWidgetState();
}

class _ProductGridViewWidgetState extends State<ProductGridViewWidget> {
  dynamic getImage(String encoded) {
    Uint8List bytes = base64.decode(encoded.split(',').last);
    return bytes;
  }



  @override
  Widget build(BuildContext context) {

    void navigateEditProducts() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductEdit(widget.product)),
      );
    }

    return Container(
      height: 150,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Expanded(
              // flex: 1,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              Image.asset("lib/images/${widget.product.title}.png", width: 75, height: 75,),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.product.title ?? '',
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                ),
              ),
            ],
          )),
          Expanded(
            // flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "\$" + widget.product.currentPrice.toStringAsFixed(2),
                      style: GoogleFonts.montserrat(
                        fontSize: 17.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    widget.product.originalPrice!=widget.product.currentPrice?
                    Text(
                      widget.product.originalPrice.toStringAsFixed(2),
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.red),
                    ):
                    Container(),
                    // Icon(Icons.edit),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Expires in",
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "${widget.product.dueDate} days",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
                SizedBox(
                  height: 5,
                ),
                widget.isAdmin?
                Text(
                  widget.product.quantity.toString(),
                  style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ): Container(),
                CounterApp(widget.product),
              ],
            ),
          ),
          widget.isAdmin?
          TextButton(onPressed: (){
            navigateEditProducts();
          }, child: Text("Edit", style: GoogleFonts.montserrat(
            color: Colors.green,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          )): Container(),


          // Expanded(
          //     flex: 2,
          //   child: CounterApp(),
          // )
        ],
      ),
    );
  }
}
