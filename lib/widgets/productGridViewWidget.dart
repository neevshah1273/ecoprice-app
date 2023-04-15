import 'dart:convert';
import 'dart:typed_data';

import 'package:ecoprice/models/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductGridViewWidget extends StatefulWidget {
  Product product;
  ProductGridViewWidget(this.product, {super.key});



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
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: const Color(0xff000000),
          )),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(2)
      // ),
      margin: const EdgeInsets.all(10),
      height: 100,
      width: 100,
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.memory(getImage(widget.product.image),
                  width: 100,
                height: 100,
              ),

            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.product.title ?? '',
                style: GoogleFonts.montserrat(
                  fontSize: 17.5,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "2lbs",
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.product.currentPrice.toString(),
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.product.originalPrice.toString(),
                style: GoogleFonts.montserrat(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.red),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                "Expires in",
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "${widget.product.dueDate} days",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
      // color: Colors.white,
    );
  }
}
