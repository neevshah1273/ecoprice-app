import 'package:ecoprice/Pages/Style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Product.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _selectedIndex = 0;
  int buttonSelected = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      buttonSelected = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {

    //print(Theme.of(context).primaryColor);

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
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
                  border: Border.all( width: 1, color: Colors.black),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Hello,", style: GoogleFonts.montserrat(
                                    fontSize: 25,
                                  ),),
                                  Text("Tirth", style: GoogleFonts.montserrat(
                                    fontSize: 40,
                                    color: Style.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ],
                              ),
                              SizedBox(
                                width: 0.4 * MediaQuery.of(context).size.width,
                              ),
                              Image.asset("lib/images/buy.png",
                                  width: 100, height: 80)
                            ]
                          ),
                          Row(
                            children: [
                              Text("Your Savings : ", style: GoogleFonts.montserrat(
                                fontSize: 22,
                                color: Style.primaryColor,
                              ),),
                              SizedBox(width: 10,),
                              Text(
                                "\$1.25",
                                style: GoogleFonts.montserrat(
                                  fontSize: 30,
                                  color: Color(0xff8bc34a),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Zero", style: GoogleFonts.montserrat(
                                fontSize: 25,
                                color: Style.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),),
                              SizedBox(width: 5,),
                              Text("Wastage.", style: GoogleFonts.montserrat(
                                fontSize: 22,
                              ),),
                              SizedBox(width: 10,),
                              Text("Go", style: GoogleFonts.montserrat(
                                fontSize: 25,
                                color: Style.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),),
                              SizedBox(width: 5,),
                              Text("Green", style: GoogleFonts.montserrat(
                                fontSize: 22,
                              ),),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
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
                            )
                        ),
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
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,

            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.white,

            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: buttonSelected == 1 ? Colors.white : Colors.black,
                  ),
                  label: 'Home',

                  backgroundColor: Theme.of(context).primaryColor
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.discount,
                  color: buttonSelected == 2 ? Colors.white : Colors.black,
                ),
                label: 'Deals',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.qr_code_scanner,
                  color: buttonSelected == 3 ? Colors.white : Colors.black,
                ),
                label: 'Scan QR',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,
                    color: buttonSelected == 4 ? Colors.white : Colors.black),
                label: 'My Profile',
              ),
            ],
            currentIndex: _selectedIndex,

            selectedLabelStyle: GoogleFonts.montserrat(
              fontSize: 15,
              color: Colors.white,
            ),

            onTap: _onItemTapped,
          ),
        ));
  }
}
