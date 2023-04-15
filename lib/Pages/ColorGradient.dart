import 'package:flutter/material.dart';

class ColorGradient {
  static const Color startColor = Color(0xff1A512E);
  static const Color endColor = Color(0xff63A91F);

  static LinearGradient getGradient({double degree = 0.0}) {
    return LinearGradient(
      colors: [startColor, endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      tileMode: TileMode.clamp,
      transform: GradientRotation(degree * (3.14 / 180)),
    );
  }

  // static LinearGradient getGradient({double degree = 0.0}) {
  //   return LinearGradient(
  //     colors: colors,
  //     begin: Alignment.topLeft,
  //     end: Alignment.bottomRight,
  //     tileMode: TileMode.clamp,
  //     transform: GradientRotation(degree * (3.14 / 180)), // Convert degree to radians
  //   );
  // }
}