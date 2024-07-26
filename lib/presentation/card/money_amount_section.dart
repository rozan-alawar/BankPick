import 'package:dakakeen/model/reciver_model.dart';
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

import '../../config/routes/routes.dart';
import '../../controller/home_provider.dart';
import '../../controller/service_provider.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../core/common_widget/primary_button.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';


class MoneyAmountSection extends StatelessWidget {
  const MoneyAmountSection({super.key, required this.currencyController,required this.validator});

  final TextEditingController currencyController;
  final String Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return   Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color:sl<ServiceProvider>().isDark?Colors.black.withOpacity(0.3): Colors.black.withOpacity(0.4),
        ),
        color:sl<ServiceProvider>().isDark?Colors.black.withOpacity(0.3): Colors.white.withOpacity(0.8),
      ),
      child: Column(
        children: [
          30.height,
          Row(
            children: [
              PrimaryText(
                'Enter Your Amount',
                color: ColorManager.secondaryText,
                fontSize: 12.sp,
              ),
              Spacer(),
              PrimaryText(
                'Change Currency',
                color: Colors.red,
                fontSize: 12.sp,
              ),
            ],
          ),
          10.height,
          Row(
            children: [
              PrimaryText(
                'USD',
                color: Colors.lightBlue,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
              16.width,
              Column(
                children: [
                  25.height,
                  SizedBox(
                    height: 80.h,
                    width: 200.w,
                    child: PrimaryTextField(
                      keyboardType: TextInputType.number,
                      hintText: '2200.00',

                      hintStyle: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      textStyle: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: currencyController,
                      validator: validator,
                    ),
                  ),
                ],
              ),
            ],
          ),
          20.height,
        ],
      ),
    );
  }
}
