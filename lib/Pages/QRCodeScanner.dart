// import 'package:ecoprice/Pages/Style.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class QRCodeScannerScreen extends StatefulWidget {
//   @override
//   _QRCodeScannerScreenState createState() => _QRCodeScannerScreenState();
// }
//
// class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
//   QRViewController? _qrViewController;
//   final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('QR Code Scanner')),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 5,
//             child: QRView(
//               key: _qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: Text('Scan a QR code'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       _qrViewController = controller;
//     });
//     _qrViewController!.scannedDataStream.listen((scanData) {
//       // Handle the scanned QR code data
//       print('Scanned data: ${scanData.code}');
//     });
//   }
//
//   @override
//   void dispose() {
//     _qrViewController?.dispose();
//     super.dispose();
//   }
// }



