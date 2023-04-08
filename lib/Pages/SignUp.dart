import 'package:ecoprice/Pages/Style.dart';
import 'package:flutter/material.dart';
import 'Style.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Style.AppBarStyling.backgroundColor,
          title: Center(
            child: Text(
              "Sign up and be heard!",
              style: TextStyle(),
            ),
          )),
      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width) / 5, top: 25),
              child: Text(
                "Sign up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              )),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 5,
                vertical: 10),
            child: const Text(
                "Sign up now to be the first to know about special deals"),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 5,
                vertical: 7.5),
            child: const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Style.primaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: "Full Name",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 5,
                vertical: 7.5),
            child: const TextField(

              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Style.primaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: "Phone Number",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 5,
                vertical: 7.5),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail,
                  color: Style.primaryColor,
                ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: "Email address",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 5,
                vertical: 7.5),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_open,
                  color: Style.primaryColor,
                ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: "Password",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 5,
                vertical: 7.5),
            child: const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Style.primaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: "Confirm Password",
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width) / 5),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Style.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: const Text("Sign Up")),
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: (MediaQuery.of(context).size.width) / 5, vertical: 0),
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Already have account ?",
                    style: TextStyle(
                      color: Color(0xff40513b),
                    ),
                  )))
        ],
      ),
    );
  }
}
