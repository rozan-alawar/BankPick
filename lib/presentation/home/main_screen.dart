import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controller/home_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: homeProvider.screens[homeProvider.currentIndex],
      bottomNavigationBar: Consumer<HomeProvider>(
        builder: (context, value, child) => SizedBox(
          height: 80.h,
          child: BottomNavigationBar(
            elevation: 0,

            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            currentIndex: homeProvider.currentIndex,
            selectedItemColor: ColorManager.primary,
            unselectedItemColor: const Color(0xff8B8B94),
            showUnselectedLabels: true,
            showSelectedLabels: true,
            unselectedLabelStyle: const TextStyle(
              color: Color(0xff8B8B94),
              fontWeight: FontWeight.w600,
            ),
            onTap: (value) => homeProvider.setIndex(value),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconAssets.home,
                  width: 30.w,
                  height: 30.h,
                  color: homeProvider.currentIndex == 0
                      ? ColorManager.primary
                      : const Color(0xff8B8B94),
                ),
                label: LocaleKeys.home.tr(),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconAssets.wallet,
                  width: 30.w,
                  height: 30.h,
                  color: homeProvider.currentIndex == 1
                      ? ColorManager.primary
                      : const Color(0xff8B8B94),
                ),
                label: LocaleKeys.my_card.tr(),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconAssets.chart,
                  width: 30.w,
                  height: 30.h,
                  color: homeProvider.currentIndex == 2
                      ? ColorManager.primary
                      : const Color(0xff8B8B94),
                ),
                label: LocaleKeys.statistics.tr(),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconAssets.setting,
                  width: 30.w,
                  height: 30.h,
                  color: homeProvider.currentIndex == 3
                      ? ColorManager.primary
                      : const Color(0xff8B8B94),
                ),
                label:LocaleKeys.settings.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
