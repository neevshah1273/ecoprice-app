import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:ecoprice/Pages/Products.dart';
import 'package:flutter/material.dart';
import 'ColorGradient.dart';
import 'package:ecoprice/Pages/Cart.dart';
import 'package:ecoprice/Pages/DealProducts.dart';
import 'package:ecoprice/Pages/ProductAdd.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/user.dart';

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
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  int _selectedIndex = 2;
  int buttonSelected = 3;


  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

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
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: ColorGradient.getGradient(degree: 140), // Set the gradient
            ),),
          title: Center(
            child: Text('Scan QR Code', style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
        fontSize: 25,
      ),),
          )),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            if (!mounted) return;

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
      bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            gradient: ColorGradient.getGradient(),
          ),
          child: BottomNavigationBar(
            onTap: (index) => _onItemTapped(index),
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.white,
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
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}