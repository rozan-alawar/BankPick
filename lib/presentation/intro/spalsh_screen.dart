import 'dart:async';

import 'package:dakakeen/config/routes/routes.dart';
import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:dakakeen/core/utils/navigation.dart';
import 'package:dakakeen/injection_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool isFirstTime = CacheHelper.getData(key: 'isFirstTime') ?? true;

    if (isFirstTime) {
       CacheHelper.saveData(key: 'isFirstTime',value:  false);
      Timer(const Duration(milliseconds: 800), ()=>sl<NavigationService>().navigateToAndRemove(Routes.onboarding) );

    } else {
      Timer(const Duration(milliseconds: 800), ()=>sl<NavigationService>().navigateTo(Routes.auth) );


  }
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        width: double.infinity,
        height: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAssets.appLogoPng, width: 80.w, height: 80.h,),
            10.height,
            PrimaryText(LocaleKeys.bank_pick.tr(),fontSize: 35.sp,fontWeight: FontWeight.w500,) ,
          ],
        ),
      ),
    );
  }
}
