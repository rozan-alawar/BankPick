import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: fontSize.sp,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle _getDashedStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      decorationColor: Colors.blue,
      decoration: TextDecoration.underline,
      decorationThickness: 3,
      decorationStyle: TextDecorationStyle.dashed,
      overflow: TextOverflow.ellipsis,
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
  );
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// Light style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

TextStyle getDashedStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getDashedStyle(fontSize, FontWeightManager.regular, color);
}
// Extra Light style

// TextStyle getExtraLightStyle(
//     {double fontSize = FontSize.s12, required Color color}) {
//   return _getTextStyle(fontSize, FontWeightManager.extraLight, color);
// }

// bold style
TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
  );
}

//extra bold style
TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.extraBold, color);
}

//semi bold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
// black style
// TextStyle getBlackStyle(
//     { double fontSize =  FontSize.s12, required Color color}) {
//   return _getTextStyle(fontSize, FontWeightManager.black, color);
// }