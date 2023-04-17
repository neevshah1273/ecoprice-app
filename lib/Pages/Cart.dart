import 'package:ecoprice/Pages/CheckOut.dart';
import 'package:ecoprice/Pages/Style.dart';
import '../services/productService.dart';
import 'QRCodeScanner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Products.dart';
import 'package:camera/camera.dart';
import 'package:ecoprice/widgets/productGridViewWidget.dart';
import 'DealProducts.dart';
import 'package:ecoprice/models/product.dart';
import '../models/Cart.dart';
import 'package:ecoprice/models/user.dart';
import 'ColorGradient.dart';

class CartPage extends StatefulWidget {
  User user;

  CartPage(this.user, {Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _selectedIndex = 3;
  int buttonSelected = 4;

  @override
  Widget build(BuildContext context) {
    User user = widget.user;
    double totalSavings = 0;



    void navigateHome() {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Products(user)),
          (route) => false);
    }

    void navigateDeals() {
      //TODO:: Dealsss
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DealProducts(user)),
          (route) => false);
    }

    void navigateQRCode() async {
      //TODO::: QRRRRRR
      WidgetsFlutterBinding.ensureInitialized();

      // Obtain a list of the available cameras on the device.
      final cameras = await availableCameras();

      // Get a specific camera from the list of available cameras.
      final firstCamera = cameras.first;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TakePictureScreen(user, camera: firstCamera)));
    }

    void navigateCart() {
      //TODO::
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CartPage(user)),
          (route) => false);
    }

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        buttonSelected = index + 1;
        if (_selectedIndex == 0) {
          navigateHome();
        }
        if (_selectedIndex == 1) {
          navigateDeals();
        } else if (_selectedIndex == 2) {
          navigateQRCode();
        } else if (_selectedIndex == 3) {
          navigateCart();
        }
      });
    }




    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: ColorGradient.getGradient(
                      degree: 140), // Set the gradient
                ),
              ),
              backgroundColor: Style.primaryColor,
              title: Text(
                "My Cart",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 0.2 * MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Hello,",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text("Tirth",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 32,
                                        color: Style.primaryColor,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: 0.47 * MediaQuery.of(context).size.width,
                              ),
                              Image.asset("lib/images/buy.png",
                                  width: 100, height: 80)
                            ]),
                            Row(
                              children: [
                                Text(
                                  "Your Savings : ",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 22,
                                    color: Style.primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  Cart.savings.toString(),
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    color: Color(0xff4b8c24),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    gradient: ColorGradient.getGradient(),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => CheckOut(
                                                totalSavings: totalSavings),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Check Out",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: Cart.cart.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductGridViewWidget(
                            (Cart.cart.keys.elementAt(index)),
                            user.isAdminstritiveUser);
                      }),
                ),
                // Expanded(
                //   child: GridView.builder(
                //       gridDelegate:
                //           const SliverGridDelegateWithFixedCrossAxisCount(
                //               crossAxisCount: 2,
                //               mainAxisSpacing: 2.5,
                //               crossAxisSpacing: 2.5),
                //       itemBuilder: (context, index) {
                //         return Container(
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(10),
                //               border: Border.all(
                //                 width: 1,
                //                 color: Color(0xff000000),
                //               )),
                //           child: Column(
                //             children: [
                //               SizedBox(
                //                 height: 5,
                //               ),
                //               Center(
                //                 child: ClipRRect(
                //                   borderRadius: BorderRadius.circular(10),
                //                   child: Image.asset("lib/images/Tomato.png",
                //                       width: 100, height: 100),
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 5,
                //               ),
                //               Row(
                //                 children: [
                //                   SizedBox(
                //                     width: 10,
                //                   ),
                //                   Text(
                //                     "Roma Tomato",
                //                     style: GoogleFonts.montserrat(
                //                       fontSize: 17.5,
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     width: 5,
                //                   ),
                //                   Text(
                //                     "2lbs",
                //                     style: GoogleFonts.montserrat(
                //                       fontSize: 12,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: 5,
                //               ),
                //               Row(
                //                 children: [
                //                   SizedBox(
                //                     width: 10,
                //                   ),
                //                   Text(
                //                     "\$1.25",
                //                     style: GoogleFonts.montserrat(
                //                       fontSize: 15,
                //                       fontWeight: FontWeight.w700,
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     width: 10,
                //                   ),
                //                   Text(
                //                     "\$1.88",
                //                     style: GoogleFonts.montserrat(
                //                         decoration: TextDecoration.lineThrough,
                //                         color: Colors.red),
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: 5,
                //               ),
                //               Row(
                //                 children: [
                //                   SizedBox(
                //                     width: 10,
                //                   ),
                //                   Text(
                //                     "Expires in",
                //                     style: GoogleFonts.montserrat(
                //                       fontSize: 15,
                //                       color: Colors.black54,
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     width: 10,
                //                   ),
                //                   Text(
                //                     "2 days",
                //                     style: GoogleFonts.montserrat(
                //                         fontWeight: FontWeight.w500,
                //                         color: Colors.black87),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //           // decoration: BoxDecoration(
                //           //   borderRadius: BorderRadius.circular(2)
                //           // ),
                //           margin: EdgeInsets.all(10),
                //           height: 100,
                //           width: 100,
                //           // color: Colors.white,
                //         );
                //       }),
                // )
              ],
            ),
            bottomNavigationBar: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: ColorGradient.getGradient(),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                // selectedItemColor: Colors.white,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color:
                            buttonSelected == 1 ? Colors.white : Colors.black,
                      ),
                      label: 'Home',
                      backgroundColor: Colors.transparent),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.discount,
                        color:
                            buttonSelected == 2 ? Colors.white : Colors.black,
                      ),
                      label: 'Deals',
                      // backgroundColor: Colors.white,
                      backgroundColor: Colors.transparent),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.qr_code_scanner,
                        color:
                            buttonSelected == 3 ? Colors.white : Colors.black,
                      ),
                      label: "QR Code",
                      backgroundColor: Colors.transparent),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.shopping_cart,
                        color:
                            buttonSelected == 4 ? Colors.white : Colors.black,
                      ),
                      label: "Chart",
                      backgroundColor: Colors.transparent)
                ],
                currentIndex: _selectedIndex,

                selectedLabelStyle: GoogleFonts.montserrat(
                  fontSize: 15,
                ),
                onTap: _onItemTapped,
              ),
            )
            // bottomNavigationBar: BottomNavigationBar(
            //   backgroundColor: Theme.of(context).primaryColor,
            //
            //   type: BottomNavigationBarType.shifting,
            //   selectedItemColor: Colors.white,
            //
            //   items: <BottomNavigationBarItem>[
            //     BottomNavigationBarItem(
            //         icon: Icon(
            //           Icons.home,
            //           color: buttonSelected == 1 ? Colors.white : Colors.black,
            //         ),
            //         label: 'Home',
            //
            //         backgroundColor: Theme.of(context).primaryColor
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(
            //         Icons.discount,
            //         color: buttonSelected == 2 ? Colors.white : Colors.black,
            //       ),
            //       label: 'Deals',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(
            //         Icons.qr_code_scanner,
            //         color: buttonSelected == 3 ? Colors.white : Colors.black,
            //       ),
            //       label: 'Scan QR',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.person,
            //           color: buttonSelected == 4 ? Colors.white : Colors.black),
            //       label: 'My Profile',
            //     ),
            //   ],
            //   currentIndex: _selectedIndex,
            //
            //   selectedLabelStyle: GoogleFonts.montserrat(
            //     fontSize: 15,
            //     color: Colors.white,
            //   ),
            //
            //   onTap: _onItemTapped,
            // ),
            ));
  }


}
