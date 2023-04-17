import 'package:ecoprice/Pages/Style.dart';
import 'package:ecoprice/Pages/UserLogin.dart';
import 'package:ecoprice/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/user.dart';
import 'ColorGradient.dart';
import 'Products.dart';
import 'Style.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    phoneNumberController.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    User? user;


    void navigatelogin(){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => UserLogin()),
              (route) => false
      );
    }


    void navigateHome(){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Products(user!)),
              (route) => false
      );
    }

    void signUp() async {

      if(passwordController.text!=confirmPasswordController.text) {
        //TODO:: Add dialog box of password and confirm passwords must match
      }

      User? resultUser = await signup(
          nameController.text,
          phoneNumberController.text,
          emailAddressController.text,
          passwordController.text,
          );
      if(resultUser==null)return;
      setState(() {
        user = resultUser;
      });
      if(user != null){
        navigateHome();

      }
      return ;

    }


    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: ColorGradient.getGradient(degree: 140), // Set the gradient
            ),),
          backgroundColor: Style.AppBarStyling.backgroundColor,
          title: Center(
            child: Text(
              "Sign up and be heard!",
              style: GoogleFonts.montserrat(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          )),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 7),
            child: Text(
              "Sign up now to be the first to know about special deals",
              style: GoogleFonts.montserrat(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 5,
                vertical: 7.5),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Style.iconColor,
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintStyle: GoogleFonts.montserrat(
                    color: Style.primaryColor,
                  ),
                  hintText: "Name",
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 5,
                vertical: 7.5),
            child: TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Style.iconColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintStyle: GoogleFonts.montserrat(
                    color: Style.primaryColor,
                  ),
                  hintText: "Phone Number",
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 5,
                vertical: 7.5),
            child: TextField(
              controller: emailAddressController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Style.iconColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintStyle: GoogleFonts.montserrat(
                    color: Style.primaryColor,
                  ),
                  hintText: "Email address",
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 5,
                vertical: 7.5),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_open,
                    color: Style.iconColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintStyle: GoogleFonts.montserrat(
                    color: Style.primaryColor,
                  ),
                  hintText: "Password",
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 5,
                vertical: 7.5),
            child: TextField(
              obscureText: true,
              controller: confirmPasswordController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Style.iconColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintStyle: GoogleFonts.montserrat(
                    color: Style.primaryColor,
                  ),
                  hintText: "Confirm Password",
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
            ),
          ),
          const SizedBox(
            height: 40,
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
                        signUp();





                      },
                      child: Text("Sign Up", style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                    ),
                    // Icon(Icons.arrow_forward_ios_sharp, color: Colors.white,),

                  ],
                )
            ),
          ),
          Center(
            child: Container(
                padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width) / 5,
                  right: (MediaQuery.of(context).size.width) / 5,
                ),
                // alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {
                      navigatelogin();

                    },
                    child: Text(
                      "Already have account ?",
                      style: GoogleFonts.montserrat(
                        fontSize: 17.5,
                        color: Style.primaryColor,
                      ),
                    ))),
          )
        ],
      ),
    );
  }
}
