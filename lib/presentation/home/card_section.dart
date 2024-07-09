import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/presentation/home/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BuildCardSection extends StatelessWidget {
  const BuildCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20.w, vertical: 20.h),
      decoration: BoxDecoration(
        // color: Colors.blue[900],
        image: DecorationImage(
            image: AssetImage(
              ImageAssets.card,
            ),
            fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(IconAssets.card_icon),
              Spacer(),
              SvgPicture.asset(IconAssets.union),

            ],
          ),
          20.height,
          Text('4562 1122 4595 7852',
              style: TextStyle(color: Colors.white, fontSize: 22)),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryText('AR Jonson',color: Colors.white,fontWeight:FontWeight.w600,),
            ],
          ),
         20.height,
          Row(
            children: [
              Column(
                children: [
                  PrimaryText('Exp Date',color: ColorManager.white,fontSize: 10.sp,),
                  PrimaryText('24/2000',color: ColorManager.white,fontSize: 12.sp,),
                ],
              ),
              20.width,
              Column(
                children: [
                  PrimaryText('CVV',color: ColorManager.white,fontSize: 10.sp,),
                  PrimaryText('6986',color: ColorManager.white,fontSize: 12.sp,),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  SvgPicture.asset(IconAssets.master_card),
                  6.height,
                  PrimaryText('Mastercard',color: ColorManager.white,fontSize: 11.sp,),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
