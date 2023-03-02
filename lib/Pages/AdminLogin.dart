import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Admin Login"))),
      body:
          ListView(
            children: [
              const Text("Welcome to Inventory Management"),
              const Text('Enter Username'),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const Text('Enter Password'),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const Text('Forgot Password'),
              ElevatedButton(
                // style: style,
                onPressed: () {},
                child: const Text('Login'),
              ),
            ],
      ),
      // // bottomNavigationBar: ,
    );
  }
}
