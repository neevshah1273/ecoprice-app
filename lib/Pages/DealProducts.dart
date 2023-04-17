import 'Cart.dart';
import 'package:ecoprice/Pages/Style.dart';
import 'QRCodeScanner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Products.dart';
import 'package:camera/camera.dart';
import 'package:ecoprice/models/user.dart';
import 'package:ecoprice/services/productService.dart';
import 'package:ecoprice/widgets/productGridViewWidget.dart';
import '../models/product.dart';
import 'ColorGradient.dart';

class DealProducts extends StatefulWidget {
  User user;

  DealProducts(this.user, {Key? key}) : super(key: key);

  @override
  State<DealProducts> createState() => _DealProductsState();
}

class _DealProductsState extends State<DealProducts> {
  List<String> Categories = [
    "All",
    "Fruits",
    "Veggies",
    "Dairy",
    "Bakery",
    "Eggs",
    "Pasta",
    "Cereals",
    "Sauces",
    "Drinks"
  ];
  String selectedCategory = "All";
  int _selectedIndex = 1;
  int buttonSelected = 2;

  List<Product> products = [];
  List<Product> selectedProducts = [];

  // String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getAllproducts();
    });
    print(products);
  }

  void onCategorySelection(String selection) {
    setState(() {
      selectedCategory = selection;
      if (selectedCategory == "All") {
        selectedProducts = products;
      } else {
        selectedProducts = [];
        products.forEach((element) {
          if (element.category == selectedCategory) {
            selectedProducts.add(element);
          }
        });
      }
    });
  }

  _getAllproducts() async {
    List<Product> prod = await fetchAllProducts();

    setState(() {
      products = [];
      prod.forEach((element) {
        if (element.originalPrice != element.currentPrice) {
          products.add(element);
        }
      });
      if (selectedCategory == "All") {
        selectedProducts = prod;
      } else {
        selectedProducts = [];
        prod.forEach((element) {
          if (element.category == selectedCategory) {
            selectedProducts.add(element);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // User user = widget.user;
    //print(Theme.of(context).primaryColor);
    User user = widget.user;

    void navigateHome() {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Products(user)),
          (route) => false);
    }

    void navigateDeals() {
      //TODO:: Dealsss
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DealProducts(user)),
          (route) => false);
    }

    void navigateQRCode() async {
      //TODO::: QRRRRRR
      WidgetsFlutterBinding.ensureInitialized();

      // Obtain a list of the available cameras on the device.
      final cameras = await availableCameras();

      // Get a specific camera from the list of available cameras.
      final firstCamera = cameras.first;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TakePictureScreen(user, camera: firstCamera)));
    }

    void navigateCart() {
      //TODO::
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CartPage(user)),
          (route) => false);
    }

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        buttonSelected = index + 1;
        if (_selectedIndex == 0) {
          navigateHome();
        }
        if (_selectedIndex == 1) {
          navigateDeals();
        } else if (_selectedIndex == 2) {
          navigateQRCode();
        } else if (_selectedIndex == 3) {
          navigateCart();
        }
      });
    }

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: ColorGradient.getGradient(
                      degree: 140), // Set the gradient
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
            body: Column(children: <Widget>[
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
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: Categories.map((category) {
                          return InkWell(
                              onTap: () {
                                onCategorySelection(category);
                              },
                              child: box(
                                  category,
                                  selectedCategory == category
                                      ? Color(0xff4b8c24)
                                      : Colors.white));
                        }).toList(),
                      ))),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductGridViewWidget(
                          products[index], widget.user.isAdminstritiveUser);
                    }),
              ),
            ]),
            bottomNavigationBar: Container(
                height: 60,
                decoration: BoxDecoration(
                  gradient: ColorGradient.getGradient(),
                ),
                child: BottomNavigationBar(
                  onTap: _onItemTapped,
                  backgroundColor: Colors.transparent,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                          color:
                              buttonSelected == 1 ? Colors.white : Colors.black,
                        ),
                        label: 'Home',
                        backgroundColor: Colors.transparent),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.discount,
                          color:
                              buttonSelected == 2 ? Colors.white : Colors.black,
                        ),
                        label: 'Deals',
                        // backgroundColor: Colors.white,
                        backgroundColor: Colors.transparent),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.qr_code_scanner,
                          color:
                              buttonSelected == 3 ? Colors.white : Colors.black,
                        ),
                        label: "QR Code",
                        backgroundColor: Colors.transparent),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.shopping_cart,
                          color:
                              buttonSelected == 4 ? Colors.white : Colors.black,
                        ),
                        label: "Chart",
                        backgroundColor: Colors.transparent)
                  ],
                  currentIndex: _selectedIndex,
                  selectedLabelStyle: GoogleFonts.montserrat(
                    fontSize: 15,
                  ),
                ))));
  }
}

Widget box(String title, Color backgroundcolor) {
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
      child: Text(title,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          )));
}
