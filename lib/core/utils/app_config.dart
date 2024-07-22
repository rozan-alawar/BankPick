import 'dart:async';
import 'dart:math';

import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/utils/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/color_manager.dart';
import '../../injection_container.dart';
import 'navigation.dart';



class AppConfig {
  var shared = sl<CacheHelper>();

  // Future<Timer> loadData() async {
  //   return Timer(const Duration(seconds: 3), onDoneLoading);
  // }



  // showAlertDialoag(){}

  TextTheme getTextContext(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  showCustomSnackBar(String content, {bool Success = false}) {
    return sl<NavigationService>()
        .snackBarKey
        .currentState
        ?.showSnackBar(SnackBar(
          content: Text(
            content,
          ),
          backgroundColor: Success ? Colors.green : Colors.red,
          behavior: SnackBarBehavior.floating,
        ));
  }

  // showException(DioError e) {
  //   // final errorMessage = DioExceptions.fromDioError(e).toString();
  //   AppConfig.showSnakBar(
  //       "${e.response != null && e.response!.data["message"] != "" ? e.response!.data["message"] : errorMessage}",
  //       Success: false);
  // }

  // showCustomException(DioError e) {
  //   final errorMessage = DioExceptions.fromDioError(e).toString();
  //   AppConfig.showCustomSnackBar(
  //     "${e.response != null && e.response!.data["message"] != "" ? e.response!.data["message"] : errorMessage}",
  //   );
  // }

  // Format File Size
  String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = [" B", " KB", " MB", " GB", " TB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

//   void showMSPressed(Widget widget) {
//     showModalBottomSheet<int>(
//       backgroundColor: Colors.transparent,
//       context: sl<NavigationService>().navigatorKey.currentContext!,
//       builder: (context) {
//         return Popover(
//           child: widget,
//         );
//       },
//     );
//   }
}


