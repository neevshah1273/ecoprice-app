import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:ecoprice/Pages/ProductPage.dart';
import 'package:ecoprice/Pages/Products.dart';
import 'package:flutter/material.dart';
import 'package:ecoprice/Pages/Cart.dart';
import 'package:ecoprice/Pages/DealProducts.dart';
import 'package:ecoprice/Pages/ProductAdd.dart';
import '../models/product.dart';
import '../models/user.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class TakePictureScreen extends StatefulWidget {
  User user;
  TakePictureScreen(this.user, {
    super.key,
    required this.camera
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {


  int _selectedIndex = 2;
  int buttonSelected = 3;

  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;





  @override
  Widget build(BuildContext context) {

    User user = widget.user;

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
          MaterialPageRoute(builder: (context) => DealProducts(user)),
              (route) => false
      );
    }

    void navigateQRCode() async {
      //TODO::: QRRRRRR
      WidgetsFlutterBinding.ensureInitialized();

      // Obtain a list of the available cameras on the device.
      final cameras = await availableCameras();

      // Get a specific camera from the list of available cameras.
      final firstCamera = cameras.first;
      Navigator.push(context, MaterialPageRoute(builder: (context) => TakePictureScreen(user, camera: firstCamera)));
    }

    void navigateCart(){
      //TODO::
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CartPage(user)),
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



      return Scaffold(
        appBar: AppBar(title: const Text('Mobile Scanner')),
        body: MobileScanner(
          fit: BoxFit.contain,

          controller: MobileScannerController(
            // facing: CameraFacing.back,
            // torchEnabled: false,
            detectionSpeed: DetectionSpeed.noDuplicates,
            returnImage: true,
          ),
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            final Uint8List? image = capture.image;
            for (final barcode in barcodes) {
              debugPrint('Barcode found! ${barcode.rawValue}');
              Product? product = Product.fromJson(jsonDecode(barcode.rawValue!));
              if(product != null){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductPage(product, user)),
                );
                break;
              }
            }
            if (image != null) {
              // showDialog(
              //   context: context,
              //   builder: (context) =>
              //       Image(image: MemoryImage(image)),
              // );
              Future.delayed(const Duration(seconds: 500), () {
                Navigator.pop(context);
              });
            }
          },
        ),
      );
    }
  }



