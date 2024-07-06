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
      bottomNavigationBar: Consumer<HomeProvider>(builder: (context, value, child) =>  BottomNavigationBar(
          iconSize: 24.h,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
currentIndex: homeProvider.currentIndex,
          selectedItemColor: ColorManager.primary,
        unselectedItemColor:Color(0xff8B8B94) ,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedLabelStyle: const TextStyle(color:  Color(0xff8B8B94),fontWeight: FontWeight.w600,),
          onTap: (value) => homeProvider.setIndex(value),
          items:  [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.home, width: 24.w,height: 24.h,color: homeProvider.currentIndex ==0?ColorManager.primary:const Color(0xff8B8B94),),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon:SvgPicture.asset(IconAssets.wallet, width: 24.w,height: 24.h,color: homeProvider.currentIndex ==1?ColorManager.primary:const Color(0xff8B8B94),),
              label: 'My Cards',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.chart, width: 24.w,height: 24.h,color: homeProvider.currentIndex ==2?ColorManager.primary:const Color(0xff8B8B94),),
              label: 'Statistics',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.setting, width: 24.w,height: 24.h,color: homeProvider.currentIndex ==3?ColorManager.primary:const Color(0xff8B8B94),),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
