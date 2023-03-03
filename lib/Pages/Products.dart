import 'package:flutter/material.dart';
import 'Product.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("PRODUCTS"),
          centerTitle: true,
          actions: const [
            ElevatedButton(
              onPressed: null,
              child: Icon(Icons.add_rounded, )
            )
            ]
        ),
        body: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 6.0, mainAxisSpacing: 6.0), children: [
          Product(),
          Product(),
          Product(),
          Product(),
          Product(),
          Product(),
        ],),
        bottomNavigationBar: BottomNavigationBar(
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
    ));
  }
}


