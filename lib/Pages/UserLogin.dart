import 'package:ecoprice/Pages/SignUp.dart';
import 'package:ecoprice/Pages/Style.dart';
import 'package:ecoprice/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/user.dart';
import 'ColorGradient.dart';
import 'Products.dart';
import 'Style.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {

  User? user;

  @override
  void initState(){
    //TODO: Remove pre-populated username & password
    userNameController.text = "u01@gmail.com";
    passwordController.text = "12345678";
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    void navigateSignup(){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignUp()),
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

    void logIn() async {



      User? resultUser = await authenticate(userNameController.text, passwordController.text);
      setState(() {
        user = resultUser;
      });
      if(user != null){
        navigateHome();

      }
      return ;
    }


    String userName = "";

    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: ColorGradient.getGradient(degree: 140), // Set the gradient
            ),),
          backgroundColor: Style.primaryColor,
          title: Center(
            child: Text(
              "User Login",
              style: GoogleFonts.montserrat(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        body: Container(
          margin:
          EdgeInsets.only(top: 0.08 * MediaQuery.of(context).size.height),
          child: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.height / 5,
                  margin: EdgeInsets.only(bottom: 30),
                  child: Image.asset("lib/images/logo.png"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 7.5),
                  child: TextField(
                    controller: userNameController,
                    onChanged: (value){
                      userName = value;
                    },
                    // controller: myController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Style.iconColor,
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        hintStyle: GoogleFonts.montserrat(
                          color: Style.primaryColor,
                        ),
                        hintText: "Enter Username",
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 20),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Style.iconColor,
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        hintStyle: GoogleFonts.montserrat(
                          color: Style.primaryColor,
                        ),
                        hintText: "Enter Password",
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
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
                          TextButton(
                            onPressed: () {

                              logIn();

                              // print('Input value: $userName');
                              // print('Username:  ' + userNameController.text);
                              // print('Password:  ' + passwordController.text);

                            },
                            child: Text("Sign In", style: GoogleFonts.montserrat(
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
                  height: 5,
                ),
                Center(
                    child: TextButton(
                      onPressed: () {
                        navigateSignup();
                      },
                      child: Text(
                        "Don't have an account?",
                        style: GoogleFonts.montserrat(
                          fontSize: 17.5,
                          color: Style.primaryColor,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
