import 'package:ecoprice/Pages/Style.dart';
import 'package:ecoprice/services/productService.dart';
import 'package:ecoprice/widgets/productGridViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/product.dart';
import 'FilterProductDialog.dart';
import 'Product.dart';
import 'ColorGradient.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int _selectedIndex = 0;
  int buttonSelected = 1;

  List<Product> products = [];

  @override
  void initState () {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _getAllproducts();
    });
  print(products);
  }

  _getAllproducts() async {

    List<Product> prod = await fetchAllProducts();

    setState(()  {
      products = prod;
    });
  }


  void navigateHome(){
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);

  }

  void navigateDeals(){
    Navigator.pushNamedAndRemoveUntil(context, '/deals', (route) => false);

  }

  void navigateQRCode(){
    Navigator.pushNamedAndRemoveUntil(context, '/qr_scanner', (route) => false);

  }

  void navigateCart(){
    Navigator.pushNamedAndRemoveUntil(context, '/cart', (route) => false);

  }

  void navigateProduct(String id){
    Navigator.pushNamedAndRemoveUntil(context, '/product/${id}', (route) => false);

  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      buttonSelected = index + 1;
      if(_selectedIndex==0){
        navigateHome();
      }
      if(_selectedIndex==1){
        navigateDeals();
      }
      else if(_selectedIndex==2){
        navigateQRCode();
      }
      else if(_selectedIndex==3){
        navigateCart();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(Theme.of(context).primaryColor);

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient:
                ColorGradient.getGradient(degree: 140), // Set the gradient

          ),
        ),
        backgroundColor: Style.primaryColor,
            title: Text(
          "Products",
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
              ListTile(
              title: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: GoogleFonts.montserrat(
                      fontSize: 20,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Style.iconColor,
                      size: 30,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
    ),
              Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children : [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 50,
                  width: 0.2 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff9acd32),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(onPressed: (){}, child:
                  Text("All", style: GoogleFonts.montserrat(
                    fontSize: 17.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ))),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 50,
                  width: 0.2 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(onPressed: (){}, child:
                  Text("Fruits", style: GoogleFonts.montserrat(
                    fontSize: 17.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ))),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 50,
                  width: 0.25 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(onPressed: (){}, child:
                  Text("Veggies", style: GoogleFonts.montserrat(
                    fontSize: 17.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ))),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 50,
                  width: 0.2 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(onPressed: (){}, child:
                  Text("Dairy", style: GoogleFonts.montserrat(
                    fontSize: 17.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ))),
                ),
              ],
            ),
          ),




                  Expanded(
                  child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2.5,
                      crossAxisSpacing: 2.5),

                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductGridViewWidget(products[index]);
                    }),
            ),

      ]
    ),


      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          gradient: ColorGradient.getGradient(),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          // selectedItemColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: buttonSelected == 1 ? Colors.white : Colors.black,
                ),
                label: 'Home',
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.discount,
                  color: buttonSelected == 2 ? Colors.white : Colors.black,
                ),
                label: 'Deals',
                // backgroundColor: Colors.white,
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.qr_code_scanner,
                  color: buttonSelected == 3 ? Colors.white : Colors.black,
                ),
                label: "QR Code",
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: buttonSelected == 4 ? Colors.white : Colors.black,
                ),
                label: "Chart",
                backgroundColor: Colors.transparent)
          ],
          currentIndex: _selectedIndex,

          selectedLabelStyle: GoogleFonts.montserrat(
            fontSize: 15,

          ),
          )
        )
      )
    );
  }
}
