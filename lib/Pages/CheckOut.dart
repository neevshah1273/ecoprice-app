import 'package:ecoprice/Pages/Style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Product.dart';
import 'package:gif_view/gif_view.dart';
import 'ColorGradient.dart';

class CheckOut extends StatelessWidget {
  // CheckOut({Key? key, required this.totalSavings}) : super(key: key);
  CheckOut({super.key, required this.totalSavings});
  double totalSavings;

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
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 25,
              ),
            ),
          )),
      body: Column(
        children: [
          SizedBox(height: 100,),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
              child: Image.asset(
                "lib/images/check-mark.png",
                height: 200,
                width: 200,
                // default is 15 FPS
              )
          ),
          SizedBox(height: 20,),
          Text("Congratulations", style: GoogleFonts.montserrat(
            fontSize: 30,
            color: Style.primaryColor,
            fontWeight: FontWeight.w500,
          ),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your Savings : ", style: GoogleFonts.montserrat(
                fontSize: 25,
                color: Style.primaryColor,
                fontWeight: FontWeight.w500,
              ),),
              Text("${totalSavings}", style: GoogleFonts.montserrat(
                fontSize: 35,
                color: Color(0xff3f7d27),
                fontWeight: FontWeight.w500,
              ),),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Zero ", style: GoogleFonts.montserrat(
                fontSize: 35,
                color: Color(0xff3f7d27),
                fontWeight: FontWeight.w500,
              ),),
              Text("Wastage  ", style: GoogleFonts.montserrat(
                fontSize: 25,
                color: Style.primaryColor,
                fontWeight: FontWeight.w500,
              ),),
              Text("Go ", style: GoogleFonts.montserrat(
                fontSize: 35,
                color: Color(0xff3f7d27),
                fontWeight: FontWeight.w500,
              ),),
              Text("Green", style: GoogleFonts.montserrat(
                fontSize: 25,
                color: Style.primaryColor,
                fontWeight: FontWeight.w500,
              ), ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text("Zero"),
          //     Text("Wastage"),
          //   ],
          // ),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
