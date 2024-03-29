// import 'dart:async';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:camera/camera.dart';
// import 'package:ecoprice/Pages/Cart.dart';
// import 'package:ecoprice/Pages/DealProducts.dart';
// import 'package:ecoprice/Pages/ProductAdd.dart';
// import 'package:ecoprice/Pages/QRCodeScanner.dart';
// import 'package:ecoprice/Pages/Style.dart';
// import 'package:ecoprice/Pages/WelcomePage.dart';
// import 'package:ecoprice/services/productService.dart';
// import 'package:ecoprice/widgets/productGridViewWidget.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:searchfield/searchfield.dart';
// import '../models/product.dart';
// import '../models/user.dart';
// import 'ColorGradient.dart';
//
// class Scan extends StatefulWidget {
//   const Scan({Key? key}) : super(key: key);
//
//   @override
//   State<Scan> createState() => _ScanState();
// }
//
// class _ScanState extends State<Scan> {
//   MobileScannerController cameraController = MobileScannerController();
//   bool _screenOpened = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Mobile Scanner"),
//         actions: [
//           IconButton(
//             color: Colors.white,
//             icon: ValueListenableBuilder(
//               valueListenable: cameraController.torchState,
//               builder: (context, state, child) {
//                 switch (state as TorchState) {
//                   case TorchState.off:
//                     return const Icon(Icons.flash_off, color: Colors.grey);
//                   case TorchState.on:
//                     return const Icon(Icons.flash_on, color: Colors.yellow);
//                 }
//               },
//             ),
//             iconSize: 32.0,
//             onPressed: () => cameraController.toggleTorch(),
//           ),
//           IconButton(
//             color: Colors.white,
//             icon: ValueListenableBuilder(
//               valueListenable: cameraController.cameraFacingState,
//               builder: (context, state, child) {
//                 switch (state as CameraFacing) {
//                   case CameraFacing.front:
//                     return const Icon(Icons.camera_front);
//                   case CameraFacing.back:
//                     return const Icon(Icons.camera_rear);
//                 }
//               },
//             ),
//             iconSize: 32.0,
//             onPressed: () => cameraController.switchCamera(),
//           ),
//         ],
//       ),
//       body: MobileScanner(
//         // allowDuplicates: true,
//         controller: cameraController,
//         onDetect: _foundBarcode,
//       ),
//     );
//   }
//
//   void _foundBarcode(Barcode barcode, MobileScannerArguments? args) {
//     /// open screen
//     if (!_screenOpened) {
//       final String code = barcode.rawValue ?? "---";
//       debugPrint('Barcode found! $code');
//       _screenOpened = true;
//       Navigator.push(context, MaterialPageRoute(builder: (context) =>
//           FoundCodeScreen(screenClosed: _screenWasClosed, value: code),));
//     }
//   }
//
//   void _screenWasClosed() {
//     _screenOpened = false;
//   }
// }
//
// class FoundCodeScreen extends StatefulWidget {
//   final String value;
//   final Function() screenClosed;
//   const FoundCodeScreen({
//     Key? key,
//     required this.value,
//     required this.screenClosed,
//   }) : super(key: key);
//
//   @override
//   State<FoundCodeScreen> createState() => _FoundCodeScreenState();
// }
//
// class _FoundCodeScreenState extends State<FoundCodeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Found Code"),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             widget.screenClosed();
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_outlined,),
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text("Scanned Code:", style: TextStyle(fontSize: 20,),),
//               SizedBox(height: 20,),
//               Text(widget.value, style: TextStyle(fontSize: 16,),),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }