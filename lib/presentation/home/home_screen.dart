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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.height,
            BuildProfileSection(),
            32.height,
            // BuildCardSection(),
            Image.asset(
              ImageAssets.card,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            30.height,
            TransactionButtons(),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryText(
                  'Transaction',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                PrimaryText(
                  'See All',
                  color: ColorManager.primary,
                ),
              ],
            ),
            20.height,
            Expanded(
              child: ListView.separated(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (context, index) => 22.width,
                itemBuilder: (context, index) =>  Row(
                  children: [
                    Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                          color: Color(0xffF4F4F4),
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Center(
                        child: SvgPicture.asset(
                          IconAssets.sent,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ),
                    17.width,
                    Column(
                      children: [
                        PrimaryText(
                          'Apple Store',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                        6.height,
                        PrimaryText(
                          'Entertainment',
                          color: ColorManager.secondaryText,
                        ),
                      ],
                    ),
                    Spacer(),
                    PrimaryText(
                      '- \$5,99',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24.h,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
selectedItemColor: ColorManager.primary,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: Color(0xff8B8B94),
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
