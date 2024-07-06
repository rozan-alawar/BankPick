import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/presentation/home/profile_section.dart';
import 'package:dakakeen/presentation/home/transaction_buttons_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controller/home_provider.dart';
import 'card_section.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(

      body:homeProvider.screens[homeProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24.h,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        selectedItemColor: ColorManager.primary,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: const Color(0xff8B8B94),
        items:  [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IconAssets.home, width: 24.w,height: 24.h,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:SvgPicture.asset(IconAssets.wallet, width: 24.w,height: 24.h,),
            label: 'My Cards',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IconAssets.chart, width: 24.w,height: 24.h,),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IconAssets.setting, width: 24.w,height: 24.h,),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
