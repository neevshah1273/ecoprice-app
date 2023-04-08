import 'package:ecoprice/Pages/Style.dart';
import 'package:flutter/material.dart';
import 'Style.dart';

class UserLogin extends StatelessWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("User Login"),
          ),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                child: Image.asset("lib/images/image33.png"),
                width: MediaQuery.of(context).size.width / 5,
                height: MediaQuery.of(context).size.height / 5,
                margin: EdgeInsets.all(10),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.blue),
                      hintText: "Enter Username"),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.blue),
                      hintText: "Enter Password"),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(onPressed: () {}, child: Text("Login")),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text("You are new ?"),
              )
            ],
          ),
        ));
  }
}
