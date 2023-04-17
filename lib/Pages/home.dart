import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
  int buttonSelected = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      buttonSelected = index+1;
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.amber[600],
                width: MediaQuery.of(context).size.width-70,
                height: 48.0,
                child: const Center(
                  child: Text("Products",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container(
                child: const Icon(
                  Icons.filter_alt_rounded,
                  color: Colors.black,
                  size: 50,
                ),
              )
            ],
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: buttonSelected==1? Colors.amber[800]: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount
              ,color:buttonSelected==2? Colors.amber[800]: Colors.black,),
            label: 'Deals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner,
              color:buttonSelected==3? Colors.amber[800]: Colors.black ,
            ),
            label: 'Scan QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.person,
                color:buttonSelected==4? Colors.amber[800]: Colors.black ),
            label: 'My Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    )
    );
  }
}
