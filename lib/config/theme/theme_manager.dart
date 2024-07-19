// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'color_manager.dart';
// import 'font_manager.dart';
// import 'style_manager.dart';
// import 'value_manager.dart';
//
// ThemeData appTheme() {
//   return ThemeData(
//     brightness: Brightness.light,
//     useMaterial3: true,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     dividerColor: Colors.transparent,
//     fontFamily: FontConstants.fontFamily,
//     primaryColor: ColorManager.primary,
//     // scaffoldBackgroundColor: ColorManager.backgroundColor,
//     //TextTheme
//     textButtonTheme: TextButtonThemeData(
//       style: TextButton.styleFrom(
//         textStyle:
//             TextStyle(fontWeight: FontWeightManager.semiBold, fontSize: 16.sp),
//       ),
//     ),
//     textTheme: TextTheme(
//       // displayLarge: getBoldStyle(color: ColorManager.black, fontSize: 34.sp),
//       // displayMedium: getMediumStyle(color: ColorManager.black, fontSize: 22.sp),
//       // displaySmall: getRegularStyle(color: ColorManager.black, fontSize: 17.sp),
//       // headlineMedium: getLightStyle(color: ColorManager.black, fontSize: 15.sp),
//       // headlineSmall: getLightStyle(color: ColorManager.black, fontSize: 15.sp),
//       // titleLarge: getLightStyle(color: ColorManager.black, fontSize: 13.sp),
//       // bodyLarge: getRegularStyle(color: ColorManager.black, fontSize: 14.sp),
//       // bodyMedium: getRegularStyle(color: ColorManager.black, fontSize: 13.sp),
//       // titleMedium: getRegularStyle(color: ColorManager.black, fontSize: 11.sp),
//       // titleSmall: getRegularStyle(color: ColorManager.black, fontSize: 16.sp),
//       // labelLarge: getRegularStyle(color: ColorManager.black, fontSize: 17.sp),
//       // bodySmall: getRegularStyle(color: ColorManager.black, fontSize: 12.sp),
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       errorStyle: const TextStyle(height: 0, color: ColorManager.transparent),
//       hintStyle: getRegularStyle(
//           color: ColorManager.primaryText.withOpacity(0.4),
//           fontSize: FontSize.s16.sp),
//       fillColor: ColorManager.white,
//       enabledBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(7),
//           topRight: Radius.circular(7),
//           bottomRight: Radius.circular(7),
//           bottomLeft: Radius.circular(7),
//         ),
//         borderSide: BorderSide(color: ColorManager.white, width: 1),
//       ),
//       errorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(7),
//           topRight: Radius.circular(7),
//           bottomRight: Radius.circular(7),
//           bottomLeft: Radius.circular(7),
//         ),
//         borderSide: BorderSide(color: Colors.red),
//       ),
//       focusedErrorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(7),
//           topRight: Radius.circular(7),
//           bottomRight: Radius.circular(7),
//           bottomLeft: Radius.circular(7),
//         ),
//         borderSide: BorderSide(color: Colors.red),
//       ),
//       focusedBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(7),
//           topRight: Radius.circular(7),
//           bottomRight: Radius.circular(7),
//           bottomLeft: Radius.circular(7),
//         ),
//         borderSide: BorderSide(
//           color: ColorManager.blaceholderText,
//         ),
//       ),
//     ),
//     // ),
//     // cardTheme: const CardTheme(
//     //     color: ColorManager.darkGrey,
//     //     shadowColor: Colors.grey,
//     //     elevation: AppSize.s4),
//     // app bar theme
//
//     // appBarTheme: AppBarTheme(
//     //     iconTheme: const IconThemeData(
//     //       color: ColorManager.black, //change your color here
//     //     ),
//     //     // ac
//     //     actionsIconTheme: const IconThemeData(color: ColorManager.black),
//     //     centerTitle: true,
//     //     color: ColorManager.backgroundColor,
//     //     elevation: 0,
//     //     titleTextStyle:
//     //         getBoldStyle(fontSize: FontSize.s20, color: ColorManager.black)),
//     // // button theme
//     // buttonTheme: const ButtonThemeData(
//     //   shape: StadiumBorder(),
//     //   disabledColor: Colors.grey,
//     //   buttonColor: ColorManager.primary,
//     // ),
//     // elevated button them
//
//     // elevatedButtonTheme: ElevatedButtonThemeData(
//     //     style: ElevatedButton.styleFrom(
//     //   textStyle: getSemiBoldStyle(
//     //       color: ColorManager.darkGrey, fontSize: FontSize.s16),
//     //   backgroundColor: ColorManager.primary,
//     //   shape: RoundedRectangleBorder(
//     //     borderRadius: BorderRadius.circular(7.r),
//     //   ),
//     // )),
//     // navigationBarTheme
//     // navigationBarTheme:NavigationBarThemeData(backgroundColor: ColorManager.red,elevation: 5)
//   );
// }


import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:flutter/material.dart';

class ThemeDataStyle {

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(backgroundColor: ColorManager.transparent),
    colorScheme: ColorScheme.light(

      background: Colors.grey.shade100,
      primary: ColorManager.primary,
      secondary: Colors.deepPurple.shade300,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(backgroundColor: ColorManager.transparent),
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: ColorManager.primary,
      secondary: Colors.deepPurple.shade700,

    ),

  );

}