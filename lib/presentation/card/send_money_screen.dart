import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_textfiled.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/extensions/validation.dart';
import 'package:dakakeen/model/card_model.dart';
import 'package:dakakeen/presentation/home/card_section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controller/home_provider.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_button.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          // 20.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => sl<NavigationService>().pop(),
                  child: CircularCard(
                    widget: SvgPicture.asset(
                      IconAssets.arrow_back,
                      color: Colors.black,
                    ),
                    width: 45.w,
                    height: 45.h,
                  ),
                ),
                80.width,
                PrimaryText(
                  'Send Money',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
              ],
            ),
          ),
          40.height,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(homeProvider.user!.cards.length,
                  (index) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: index == 0 ? 20.w : 6.w,
                      end: index == homeProvider.user!.cards.length - 1
                          ? 20.w
                          : 6.w),
                  child: Container(
                    height: 240.h,
                    width: 320.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: BuildCardSection(
                      cardNumber: homeProvider.user!.cards[index].cardNumber,
                      cardHolderName:
                          homeProvider.user!.cards[index].cardHolder,
                      expiryDate: homeProvider.user!.cards[index].expiryDate,
                      cvv: homeProvider.user!.cards[index].cvv,
                      cardType: homeProvider.user!.cards[index].cardType,
                    ),
                  ),
                );
              }),
            ),
          ),
          40.height,
          Container(
            height: 120.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              border: Border.all(
                color: ColorManager.secondaryText,
              ),
              color: Colors.white.withOpacity(0.8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  'Send to',
                  fontWeight: FontWeight.w500,
               ),
              ],
            ),
          ),
          20.height,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              border: Border.all(
                color: ColorManager.secondaryText,
              ),
              color: Colors.white.withOpacity(0.8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    PrimaryText(
                      'Enter Your Amount',
                      color: ColorManager.secondaryText,
                      fontSize: 11.sp,
                    ),
                    Spacer(),
                    PrimaryText(
                      'Change Currency',
                      color: Colors.red,
                      fontSize: 11.sp,
                    ),
                  ],
                ),
                20.height,
                Row(
                  children: [
                    PrimaryText(
                      'USD',
                      color: Colors.lightBlue,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    16.width,
                    PrimaryText(
                      '2200.00',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ],
            ),
          ),
          40.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: PrimaryButton(
              color: ColorManager.primary,
              onPressed: () => sl<NavigationService>().pop(),
              child: PrimaryText(
                'Send Money',
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
