// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:speech_to_/';
//
// class SpeechtoText extends StatefulWidget {
//   const SpeechtoText({Key? key}) : super(key: key);
//
//   @override
//   State<SpeechtoText> createState() => _SpeechtoTextState();
// }
//
// class _SpeechtoTextState extends State<SpeechtoText> {
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         bottomNavigationBar: Container(
//           height: 200,
//           color: Colors.white,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               // 1. <-- SEE HERE
//               if (!_isSpeechStarted) ...[
//                 FloatingActionButton(
//                   backgroundColor: const Color(0xff764abc),
//                   child: Icon(
//                     Icons.mic,
//                     size: 35,
//                   ),
//                   onPressed: () {
//                     _startSpeechRecognition();
//                   },
//                 ),
//               ] else ...[
//                 FloatingActionButton(
//                   backgroundColor: const Color(0xff764abc),
//                   child: Icon(
//                     Icons.stop,
//                     size: 35,
//                   ),
//                   onPressed: () {
//                     _stopSpeechRecognition();
//                   },
//                 ),
//               ],
//               // 2. <-- SEE HERE
//               if (_isListening) ...[
//                 Text(
//                   kListening,
//                   style: GoogleFonts.nunito(
//                       textStyle:
//                       TextStyle(color: Colors.black, fontSize: 22.5)),
//                 ),
//               ],
//             ],
//           ),
//         ),
//         appBar: AppBar(
//           title: Text('Voice Assistant'),
//           backgroundColor: const Color(0xff764abc),
//         ),
//         body: Container(
//           padding: EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       _ttsGreet,
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             fontSize: 30.5, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//                 // 3. <-- SEE HERE
//                 TextField(
//                   controller: _myController,
//                   readOnly: true,
//                   onChanged: (String text) {
//                     setState(() {
//                       _isContentsPresent = text.isNotEmpty;
//                     });
//                   },
//                   //focusNode: _nodeText1,
//                   cursorColor: Colors.grey,
//                   style:
//                   GoogleFonts.poppins(textStyle: TextStyle(fontSize: 30.5)),
//                   keyboardType: TextInputType.multiline,
//                   maxLines: null,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     hintStyle: GoogleFonts.nunito(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );;
//   }
// }
//
// // 1.
