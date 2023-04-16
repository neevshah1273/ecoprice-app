import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:ecoprice/models/product.dart';
import 'package:ecoprice/models/user.dart';
import 'package:ecoprice/services/productService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'Style.dart';
import 'ColorGradient.dart';

class ProductAdd extends StatefulWidget {
  User? user;
  ProductAdd(this.user, {Key? key}) : super(key: key);

  @override
  State<ProductAdd> createState() => _ProductState();
}

class _ProductState extends State<ProductAdd> {


  
  final productNameController = TextEditingController();
  final currentPriceController = TextEditingController();
  final originalPriceController = TextEditingController();
  final expirationDaysLeftController = TextEditingController();


  void create(String? ss) async{

    Product product = Product(
        id: '',
        title: productNameController.text,
        category: 'category',
        image: ss ?? '',
        dueDate: double.parse(expirationDaysLeftController.text),
        quantity: 50,
        currentPrice:  double.parse(currentPriceController.text),
        originalPrice: double.parse(originalPriceController.text),
        dailyConsume: double.parse('source'));

    print(productNameController.text);
    print(currentPriceController.text);
    print(originalPriceController.text);
    print(expirationDaysLeftController.text);

//    Product createdProduct = await createProduct(product);
  }


  @override
  Widget build(BuildContext context) {
    User? user = widget.user;


    Future<String?> pickImageAndEncodeBase64() async {
      final imagePicker = ImagePicker();
      final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) {
        return null;
      }

      //convert Path to File
      Uint8List imagebytes = await pickedFile.readAsBytes(); //convert to bytes
      String base64string = base64.encode(imagebytes); //convert bytes to base64 string
      print(base64string);

      return base64string;
    }

    String? ss;
    void imageHandle() async {
       ss = await pickImageAndEncodeBase64();
      print(ss);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Product",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 25,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: ColorGradient.getGradient(degree: 140), // Set the gradient
          ),),
        backgroundColor: Style.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffFEFFF8),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.black, width: 2.0)),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10, bottom: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Product Name",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10,
                    right: MediaQuery.of(context).size.width / 10),
                // padding: EdgeInsetsDirectional.symmetric(
                //     horizontal: MediaQuery.of(context).size.width / 10),
                child: TextField(
                  controller: productNameController,
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
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
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10, bottom: 5),
                  alignment: Alignment.centerLeft,
                  // padding: EdgeInsetsDirectional.symmetric(
                  //     horizontal: MediaQuery.of(context).size.width / 10),
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
                      focusedBorder: const OutlineInputBorder(
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
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10, bottom: 5),
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
                      focusedBorder: const OutlineInputBorder(
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
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10, bottom: 5),
                  // padding: EdgeInsetsDirectional.symmetric(
                  //     horizontal: MediaQuery.of(context).size.width / 10),
                  alignment: Alignment.centerLeft,
                  child: Text("Will Expire In ",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ))),
              Container(
                margin: EdgeInsets.only(bottom: 20),
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
                      focusedBorder: const OutlineInputBorder(
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
                margin: EdgeInsets.only(left: 0.25 * MediaQuery.of(context).size.width, right: 0.25 * MediaQuery.of(context).size.width),
                decoration: BoxDecoration(
                  gradient: ColorGradient.getGradient(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(width: 5,),
                        Icon(Icons.cloud_upload, color: Colors.white,),
                        TextButton(
                          onPressed: (){
                            imageHandle();
                          },
                          child: Text("Upload Image", style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                          ),),
                        ),
                        // Icon(Icons.arrow_forward_ios_sharp, color: Colors.white,),

                      ],
                    )
                ),
              ),
              // Container(
              //     child: ElevatedButton(
              //         onPressed: () {},
              //         child: Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             Icon(
              //               Icons.cloud_upload_outlined,
              //               // Specify the icon you want to use
              //               size: 25, // Set the size of the icon
              //               color: Colors.white, // Set the color of the icon
              //             ),
              //             SizedBox(
              //               width: 10,
              //             ),
              //             Text(
              //               "Upload Image",
              //               style: GoogleFonts.montserrat(
              //                 fontSize: 17.5,
              //               ),
              //             ),
              //           ],
              //         ),
              //         style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStateProperty.all(Color(0xff4cbb17))))),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                                onPressed: (){
                                  
                                  create(ss);

                                  
                                  
                                },
                                child: Text("Add", style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),),
                              ),
                              // Icon(Icons.arrow_forward_ios_sharp, color: Colors.white,),

                            ],
                          )
                      ),
                    ),
                    const SizedBox(
                      width: 20,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel", style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),),
                              ),
                              // Icon(Icons.arrow_forward_ios_sharp, color: Colors.white,),

                            ],
                          )
                      ),
                    ),
                    // Container(
                    //     width: 100,
                    //     child: ElevatedButton(
                    //       onPressed: () {},
                    //       child: Text(
                    //         "Add",
                    //         style: GoogleFonts.montserrat(
                    //           fontSize: 17.5,
                    //         ),
                    //       ),
                    //       style: ButtonStyle(
                    //           backgroundColor:
                    //               MaterialStateProperty.all(Color(0xff40513b))),
                    //     )),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    // Container(
                    //     width: 100,
                    //     child: ElevatedButton(
                    //         onPressed: () {},
                    //         child: Text(
                    //           "Cancel",
                    //           style: GoogleFonts.montserrat(
                    //             fontSize: 17.5,
                    //           ),
                    //         ),
                    //         style: ButtonStyle(
                    //             backgroundColor: MaterialStateProperty.all(
                    //                 Color(0xff40513b))))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
