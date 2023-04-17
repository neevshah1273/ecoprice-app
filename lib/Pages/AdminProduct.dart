import 'package:ecoprice/Pages/Style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ColorGradient.dart';

class AdminProduct extends StatefulWidget {
  const AdminProduct({Key? key}) : super(key: key);

  @override
  State<AdminProduct> createState() => _ProductsState();
}

class _ProductsState extends State<AdminProduct> {
  int _selectedIndex = 0;
  int buttonSelected = 1;

  void navigateHome(){
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);

  }

  void navigateDeals(){
    Navigator.pushNamedAndRemoveUntil(context, '/deals', (route) => false);

  }

  void navigateQRCode(){
    Navigator.pushNamedAndRemoveUntil(context, '/qr_scanner', (route) => false);

  }

  void navigateCart(){
    Navigator.pushNamedAndRemoveUntil(context, '/cart', (route) => false);

  }

  void navigateProduct(String id){
    Navigator.pushNamedAndRemoveUntil(context, '/product/${id}', (route) => false);

  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      buttonSelected = index + 1;
      if(_selectedIndex==0){
        navigateHome();
      }
      if(_selectedIndex==1){
        navigateDeals();
      }
      else if(_selectedIndex==2){
        navigateQRCode();
      }
      else if(_selectedIndex==3){
        navigateCart();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(Theme.of(context).primaryColor);

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient:
                ColorGradient.getGradient(degree: 140), // Set the gradient
              ),
            ),
            backgroundColor: Style.primaryColor,

            title: Text(
              "Products",
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
              ListTile(
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: GoogleFonts.montserrat(
                          fontSize: 20,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Style.iconColor,
                          size: 30,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                        color: Style.iconColor,
                        size: 30,
                      ))),
              Expanded(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2.5,
                        crossAxisSpacing: 2.5),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: Color(0xff000000),
                            )),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset("lib/images/Tomato.png",
                                    width: 100, height: 100),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Roma Tomato",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 17.5,
                                  ),
                                ),
                                SizedBox(
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
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "\$1.25",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "\$1.88",
                                  style: GoogleFonts.montserrat(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Expires in",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "2 days",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(2)
                        // ),
                        margin: EdgeInsets.all(10),
                        height: 100,
                        width: 100,
                        // color: Colors.white,
                      );
                    }),
              )
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
                      color: buttonSelected == 1 ? Colors.white : Colors.black,
                    ),
                    label: 'Home',
                    backgroundColor: Colors.transparent),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.discount,
                      color: buttonSelected == 2 ? Colors.white : Colors.black,
                    ),
                    label: 'Deals',
                    // backgroundColor: Colors.white,
                    backgroundColor: Colors.transparent),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.qr_code_scanner,
                      color: buttonSelected == 3 ? Colors.white : Colors.black,
                    ),
                    label: "QR Code",
                    backgroundColor: Colors.transparent),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: buttonSelected == 4 ? Colors.white : Colors.black,
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
          ),

        ));
  }
}
