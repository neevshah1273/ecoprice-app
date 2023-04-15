import 'dart:ffi';
import 'Style.dart';
import 'ColorGradient.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  // double screenWidth = MediaQuery.of(context).size.width;

  const WelcomePage({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {

    void navigateSignup(){
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }






    return Scaffold(
        appBar: AppBar(
        flexibleSpace: Container(
        decoration: BoxDecoration(
        gradient: ColorGradient.getGradient(degree: 140), // Set the gradient
    ),),
            // backgroundColor: Color(0xff40513b),
            title: Center(
              child: Text(
                "Welcome to Eco-Price",
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )),
        body: ListView(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(50),
              child:
                  Image.asset('lib/images/logo.png', width: 200, height: 200),
            ),
            Center(
              child: Text(
                "Eco-Price",
                style: GoogleFonts.montserrat(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  color: Style.primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Minimum Wastage",
                style: GoogleFonts.kalam(
                  fontSize: 30,
                ),
              ),
            ),
            Center(
                child: Text(
              "Maximum Savings",
              style: GoogleFonts.kalam(
                fontSize: 40,
              ),
            )),
            const SizedBox(
              height: 30,
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
                  TextButton(
                    onPressed: (){
                      navigateSignup();
                    },
                    child: Text("Get Started", style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
                  ),
                    Icon(Icons.arrow_forward_ios_sharp, color: Colors.white,),

                  ],
                )
              ),
            ),
          ],
        ));
    // );
  }
}
