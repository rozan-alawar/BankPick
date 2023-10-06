import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary = Color(0xff3628B2);
  static const Color primaryText = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
  static const Color secondaryText = Color(0xff878282);
  static const Color textFieldBox = Color(0xffF5F5F5);
  static const Color blaceholderText = Color(0xffC2C2C2);
  static const Color buyingColor = Color(0xff67B96B);
  static const Color sellingColor = Color(0xffCA5751);
  static const Color thirdOptionText = Color(0xffB1B1B1);
  static const Color thirdShadePurple = Color(0xffA7A0E4);
  static const Color transparent = Colors.transparent;

  static const blueGradient = LinearGradient(colors: <Color>[
    ColorManager.primary,
    ColorManager.thirdShadePurple,
  ]);
}
