import 'package:ecoprice/Pages/Cart.dart';
import 'package:ecoprice/Pages/ProductAdd.dart';
import 'package:ecoprice/Pages/Style.dart';
import 'package:ecoprice/Pages/WelcomePage.dart';
import 'package:ecoprice/services/productService.dart';
import 'package:ecoprice/widgets/productGridViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchfield/searchfield.dart';
import '../models/product.dart';
import '../models/user.dart';
import 'FilterProductDialog.dart';
import 'Product.dart';
import 'ColorGradient.dart';

class Products extends StatefulWidget {
  User? user;
  Products(this.user, {Key? key}) : super(key: key);

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
  //print(user)
  }

  _getAllproducts() async {

    List<Product> prod = await fetchAllProducts();

    setState(()  {
      products = prod;
    });
  }






  @override
  Widget build(BuildContext context) {
    //print(Theme.of(context).primaryColor);

    User? user = widget.user;

    void navigateHome(){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Products(user)),
              (route) => false
      );

    }

    void navigateDeals(){
      //TODO:: Dealsss
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Products(user)),
              (route) => false
      );
    }

    void navigateQRCode(){
      //TODO::: QRRRRRR
      Navigator.pushNamedAndRemoveUntil(context, '/qr_scanner', (route) => false);

    }

    void navigateCart(){
      //TODO::
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Cart()),
            (route) => false
    );
    }

    void navigateProduct(String id){
      //TODO:: product page
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Products(user)),
              (route) => false
      );
    }

    void navigateAddProduct(){

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductAdd(user!)),

      );
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
            actions: <Widget>[

              (user?.isAdminstritiveUser ?? false)? IconButton(
                icon: Icon(
                  Icons.add_box_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  navigateAddProduct();
                },
              ): Container()
            ],
      ),
            body: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(0,10)
                          )
                        ]
                    ),
                    child: SearchField<Product>(
                      hint: 'Search',
                      searchInputDecoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                              color: Colors.blueGrey.shade200,
                              width: 1
                          ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                              color: Colors.blue.withOpacity(0.8),
                              width: 2
                          ),
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      itemHeight: 50,
                      maxSuggestionsInViewPort: 8,
                      suggestionsDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suggestions:
                      products.map((e) => SearchFieldListItem<Product>(e.title?? '',item: e)).toList(),
                      onSuggestionTap: (value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WelcomePage()),
                        );
                      },
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
              onTap: _onItemTapped,
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
        ),
        )
    );
  }
}
