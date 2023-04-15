import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Style.dart';

class ProductEdit extends StatefulWidget {
  const ProductEdit({Key? key}) : super(key: key);

  @override
  State<ProductEdit> createState() => _ProductState();
}

class _ProductState extends State<ProductEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Product", style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400,
          fontSize: 25,
        ),),
        backgroundColor: Style.primaryColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Color(0xffFEFFF8),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.black, width: 2.0)),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.width / 3,
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 7.5,
                        vertical: MediaQuery.of(context).size.height / 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.white38,
                          width: 2.0,
                        )),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset("lib/images/Tomato.png",
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width / 3,
                          fit: BoxFit.cover),
                    )),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Save", style: GoogleFonts.montserrat(
                              fontSize: 17.5,
                            ),),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff40513b))),
                          )),
                      Container(
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Cancel", style: GoogleFonts.montserrat(
                                fontSize: 17.5,
                              ),),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xff40513b))))),
                    ],
                  ),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.only(bottom: 5),
                padding: EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width / 10, 0, MediaQuery.of(context).size.width / 10, 0),
                // padding: EdgeInsetsDirectional.symmetric(
                //     horizontal: MediaQuery.of(context).size.width / 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Product Name",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                )),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width / 10, 0, MediaQuery.of(context).size.width / 10, 0),
              // padding: EdgeInsetsDirectional.symmetric(
              //     horizontal: MediaQuery.of(context).size.width / 10),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintStyle: GoogleFonts.montserrat(),
                    hintText: "Product Name",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 5),
                padding: EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width / 10, 0, MediaQuery.of(context).size.width / 10, 0),
                // padding: EdgeInsetsDirectional.symmetric(
                //     horizontal: MediaQuery.of(context).size.width / 10),
                alignment: Alignment.centerLeft,
                child: Text("Current Price",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ))),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width / 10, 0, MediaQuery.of(context).size.width / 10, 0),
              // EdgeInsetsDirectional.symmetric(
              //     horizontal: MediaQuery.of(context).size.width / 10),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintStyle: GoogleFonts.montserrat(),
                    hintText: "Current Price",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 5),
                padding: EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width / 10, 0, MediaQuery.of(context).size.width / 10, 0),
                // padding: EdgeInsetsDirectional.symmetric(
                //     horizontal: MediaQuery.of(context).size.width / 10),
                alignment: Alignment.centerLeft,
                child: Text("Original Price",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ))),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width / 10, 0, MediaQuery.of(context).size.width / 10, 0),
              // padding: EdgeInsetsDirectional.symmetric(
              //     horizontal: MediaQuery.of(context).size.width / 10),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintStyle: GoogleFonts.montserrat(),
                    hintText: "Original Price",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 5),
                padding: EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width / 10, 0, MediaQuery.of(context).size.width / 10, 0),
                // padding: EdgeInsetsDirectional.symmetric(
                //     horizontal: MediaQuery.of(context).size.width / 10),
                alignment: Alignment.centerLeft,
                child: Text("Will Expire In ",
    style: GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    ))),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width / 10, 0, MediaQuery.of(context).size.width / 10, 0),
              // padding: EdgeInsetsDirectional.symmetric(
              //     horizontal: MediaQuery.of(context).size.width / 10),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintStyle: GoogleFonts.montserrat(),
                    hintText: "Days left",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
