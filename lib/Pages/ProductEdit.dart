import 'package:ecoprice/models/product.dart';
import 'package:ecoprice/services/productService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Style.dart';
import 'ColorGradient.dart';

class ProductEdit extends StatefulWidget {
  Product product;
  ProductEdit(this.product, {Key? key}) : super(key: key);

  @override
  State<ProductEdit> createState() => _ProductState();
}

class _ProductState extends State<ProductEdit> {
  final productNameController = TextEditingController();
  final categoryController = TextEditingController();
  final quantityController = TextEditingController();
  final currentPriceController = TextEditingController();
  final originalPriceController = TextEditingController();
  final expirationDaysLeftController = TextEditingController();


  @override
  void initState(){

    productNameController.text = widget.product.title!;
    categoryController.text = widget.product.category;
    quantityController.text = widget.product.quantity.toString();
    currentPriceController.text = widget.product.currentPrice.toString();
    originalPriceController.text = widget.product.originalPrice.toString();
    expirationDaysLeftController.text = widget.product.dueDate.toString();
  }

  @override
  Widget build(BuildContext context) {

    Product product = widget.product;







    void edit()async{
      Product newProduct = Product(
          id: product.id,
          title: productNameController.text,
          category: categoryController.text,
          image: product.image,
          dueDate: product.dueDate,
          quantity: int.parse(quantityController.text),
          currentPrice: double.parse(currentPriceController.text),
          originalPrice: double.parse(originalPriceController.text),
          dailyConsume: product.dailyConsume
      );
      Product res = await editProduct(newProduct);
      print(res.toJson().toString());
      Navigator.pop(context);
    }


    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient:
                ColorGradient.getGradient(degree: 140), // Set the gradient
          ),
        ),
        centerTitle: true,
        title: Text(
          "Edit Product",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 25,
          ),
        ),
        backgroundColor: Style.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                          // margin: EdgeInsets.only(left: 0.25 * MediaQuery.of(context).size.width, right: 0.25 * MediaQuery.of(context).size.width),
                          decoration: BoxDecoration(
                            gradient: ColorGradient.getGradient(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              TextButton(
                                onPressed: () {

                                  edit();
                                },
                                child: Text(
                                  "Save",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ),
                        // Container(
                        //     width: 100,
                        //     child: ElevatedButton(
                        //       onPressed: () {},
                        //       child: Text("Save", style: GoogleFonts.montserrat(
                        //         fontSize: 17.5,
                        //       ),),
                        //       style: ButtonStyle(
                        //           backgroundColor: MaterialStateProperty.all(
                        //               Color(0xff40513b))),
                        //     )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          // margin: EdgeInsets.only(left: 0.25 * MediaQuery.of(context).size.width, right: 0.25 * MediaQuery.of(context).size.width),
                          decoration: BoxDecoration(
                            gradient: ColorGradient.getGradient(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ),
                        // Container(
                        //     width: 100,
                        //     child: ElevatedButton(
                        //         onPressed: () {},
                        //         child: Text("Cancel", style: GoogleFonts.montserrat(
                        //           fontSize: 17.5,
                        //         ),),
                        //         style: ButtonStyle(
                        //             backgroundColor: MaterialStateProperty.all(
                        //                 Color(0xff40513b))))),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsetsDirectional.fromSTEB(
                      MediaQuery.of(context).size.width / 10,
                      0,
                      MediaQuery.of(context).size.width / 10,
                      0),
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
                padding: EdgeInsetsDirectional.fromSTEB(
                    MediaQuery.of(context).size.width / 10,
                    0,
                    MediaQuery.of(context).size.width / 10,
                    0),
                // padding: EdgeInsetsDirectional.symmetric(
                //     horizontal: MediaQuery.of(context).size.width / 10),
                child: TextField(
                  controller: productNameController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
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
                  padding: EdgeInsetsDirectional.fromSTEB(
                      MediaQuery.of(context).size.width / 10,
                      0,
                      MediaQuery.of(context).size.width / 10,
                      0),
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
                padding: EdgeInsetsDirectional.fromSTEB(
                    MediaQuery.of(context).size.width / 10,
                    0,
                    MediaQuery.of(context).size.width / 10,
                    0),
                // EdgeInsetsDirectional.symmetric(
                //     horizontal: MediaQuery.of(context).size.width / 10),
                child: TextField(
                  controller: currentPriceController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                  padding: EdgeInsetsDirectional.fromSTEB(
                      MediaQuery.of(context).size.width / 10,
                      0,
                      MediaQuery.of(context).size.width / 10,
                      0),
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
                padding: EdgeInsetsDirectional.fromSTEB(
                    MediaQuery.of(context).size.width / 10,
                    0,
                    MediaQuery.of(context).size.width / 10,
                    0),
                // padding: EdgeInsetsDirectional.symmetric(
                //     horizontal: MediaQuery.of(context).size.width / 10),
                child: TextField(
                  controller: originalPriceController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                  padding: EdgeInsetsDirectional.fromSTEB(
                      MediaQuery.of(context).size.width / 10,
                      0,
                      MediaQuery.of(context).size.width / 10,
                      0),
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
                padding: EdgeInsetsDirectional.fromSTEB(
                    MediaQuery.of(context).size.width / 10,
                    0,
                    MediaQuery.of(context).size.width / 10,
                    0),
                // padding: EdgeInsetsDirectional.symmetric(
                //     horizontal: MediaQuery.of(context).size.width / 10),
                child: TextField(
                  controller: expirationDaysLeftController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintStyle: GoogleFonts.montserrat(),
                      hintText: "Days left",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsetsDirectional.fromSTEB(
                      MediaQuery.of(context).size.width / 10,
                      0,
                      MediaQuery.of(context).size.width / 10,
                      0),
                  // padding: EdgeInsetsDirectional.symmetric(
                  //     horizontal: MediaQuery.of(context).size.width / 10),
                  alignment: Alignment.centerLeft,
                  child: Text("Quantity ",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ))),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsetsDirectional.fromSTEB(
                    MediaQuery.of(context).size.width / 10,
                    0,
                    MediaQuery.of(context).size.width / 10,
                    0),
                // padding: EdgeInsetsDirectional.symmetric(
                //     horizontal: MediaQuery.of(context).size.width / 10),
                child: TextField(
                  controller: quantityController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintStyle: GoogleFonts.montserrat(),
                      hintText: "Quantity",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsetsDirectional.fromSTEB(
                      MediaQuery.of(context).size.width / 10,
                      0,
                      MediaQuery.of(context).size.width / 10,
                      0),
                  // padding: EdgeInsetsDirectional.symmetric(
                  //     horizontal: MediaQuery.of(context).size.width / 10),
                  alignment: Alignment.centerLeft,
                  child: Text("Category ",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ))),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsetsDirectional.fromSTEB(
                    MediaQuery.of(context).size.width / 10,
                    0,
                    MediaQuery.of(context).size.width / 10,
                    0),
                // padding: EdgeInsetsDirectional.symmetric(
                //     horizontal: MediaQuery.of(context).size.width / 10),
                child: TextField(
                  controller: categoryController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintStyle: GoogleFonts.montserrat(),
                      hintText: "Quantity",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
