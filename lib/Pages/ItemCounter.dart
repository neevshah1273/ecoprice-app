import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Style.dart';

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {

    if(_counter > 0){
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: _decrementCounter,
          child: Icon(Icons.remove, color: Colors.green,),
        ),
        Text(
          '$_counter',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(fontSize: 5),
            ),
          ),
          // style: TextButton.styleFrom(
          //   fixedSize: Size(10, 10),
          // ),
          onPressed: _incrementCounter,
          child: Icon(Icons.add, color: Colors.green,),
        ),
      ],
    );
  }
}

// void main() {
//   runApp(CounterApp());
// }



// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// TextButton(
// onPressed: _decrementCounter,
// child: Icon(Icons.remove),
// ),
// Text(
// '$_counter',
// style: GoogleFonts.montserrat(
// fontSize: 20,
// fontWeight: FontWeight.w500,
// ),
// ),
// TextButton(
// style: ButtonStyle(
// textStyle: MaterialStateProperty.all<TextStyle>(
// TextStyle(fontSize: 5),
// ),
// ),
// onPressed: _incrementCounter,
// child: Icon(Icons.add),
// ),
// ],
// ),
