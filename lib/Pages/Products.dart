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
import 'ColorGradient.dart';

class Products extends StatefulWidget {
  User? user;
  Products(this.user, {Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  List<String> Categories = ["All","Fruits", "Veggies", "Dairy", "Bakery", "Eggs", "Pasta", "Cereals", "Sauces", "Drinks"];
  String selectedCategory = "All";

  int _selectedIndex = 0;
  int buttonSelected = 1;

  List<Product> products = [];
  List<Product> selectedProducts = [];

  void onCategorySelection(String selection){
    setState(() {
      selectedCategory = selection;
      if(selectedCategory=="All"){
        selectedProducts = products;
      }
      else{
        selectedProducts = [];
        products.forEach((element) {
          if(element.category==selectedCategory){
            selectedProducts.add(element);
          }
        });
      }
    });
  }


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
      if(selectedCategory=="All"){
        selectedProducts = prod;
      }
      else{
        selectedProducts = [];
        prod.forEach((element) {
          if(element.category==selectedCategory){
            selectedProducts.add(element);
          }
        });
      }
    });
    print(selectedProducts);
    print(selectedCategory);
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
                      height: 75,
                      margin: EdgeInsets.only(left: 10),
                      child:SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child:Row(
                            children: Categories.map((category){
                              return InkWell(
                                  onTap: (){
                                    onCategorySelection(category);
                                    print(selectedCategory);
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
                        // mainAxisSpacing: 2.5,
                        childAspectRatio: 2,
                        // crossAxisSpacing: 2.5
                      ),
                      itemCount: selectedProducts.length,
                      itemBuilder: (context, index) {
                        return ProductGridViewWidget(selectedProducts[index]);
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
