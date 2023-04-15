import 'package:flutter/material.dart';

class Style {
  static const Color primaryColor = Color(0xff40513b);
  static const Color secondaryColor = Color(0xff40513b);
  static const Color iconColor = Color(0xff3F7D27);

  static const TextStyle AppBarStyling = TextStyle(
    fontWeight: FontWeight.bold,
    backgroundColor: primaryColor,
  );

  static ButtonStyle Buttonstyling = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
  );

  static InputDecoration TextFieldStyling = InputDecoration(
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.black), borderRadius: BorderRadius.all(const Radius.circular(20))),
      hintStyle: TextStyle(color: Colors.black));
}
