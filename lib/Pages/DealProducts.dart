import 'package:ecoprice/Pages/Style.dart';
import 'package:ecoprice/services/productService.dart';
import 'package:ecoprice/widgets/productGridViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/product.dart';
import 'ItemCounter.dart';
import 'FilterProductDialog.dart';
import 'Product.dart';
import 'ColorGradient.dart';

class DealProducts extends StatefulWidget {
  const DealProducts({Key? key}) : super(key: key);

  @override
  State<DealProducts> createState() => _DealProductsState();
}

class _DealProductsState extends State<DealProducts> {

  List<String> Categories = ["All","Fruits", "Veggies", "Dairy", "Bakery", "Eggs", "Pasta", "Cereals", "Sauces", "Drinks"];
  String selectedCategory = "All";
  int _selectedIndex = 0;
  int buttonSelected = 1;

  List<Product> products = [];

  // String selectedCategory = "All";

  @override
  void initState () {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _getAllproducts();
    });
    print(products);
  }

  void onCategorySelection(String selection){
    setState(() {
      selectedCategory = selection;
    });
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
                "Deals",
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
                      height: 75,
                      margin: EdgeInsets.only(left: 10),
                      child:SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child:Row(
                            children: Categories.map((category){
                              return InkWell(
                                  onTap: (){
                                    onCategorySelection(category);
                                  },
                                  child: box(category, selectedCategory == category ? Color(0xff4b8c24) : Colors.white));
                            }).toList(),
                          )
                      )
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 2.5,
                          childAspectRatio: 2,
                          // crossAxisSpacing: 2.5
                        ),
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

Widget box(String title, Color backgroundcolor){

  return Container(
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
      color: backgroundcolor,
      // color: Color(0xff63a91f),
    ),
      margin: EdgeInsets.only(top: 5, right: 10, bottom: 5),
      width: 100,
      alignment: Alignment.center,
      child: Text(title, style: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ))
  );
}