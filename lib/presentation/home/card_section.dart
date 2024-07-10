import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/controller/home_provider.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/presentation/home/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BuildCardSection extends StatelessWidget {
   BuildCardSection({super.key, required this.cardType, required this.cvv, required this.expiryDate, required this.cardNumber, required this.cardHolderName });
   String cardNumber;
   String cardHolderName;
   String expiryDate;
   String cvv;
   String cardType;

  @override
  Widget build(BuildContext context) {
    final homeProvider= Provider.of<HomeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20.w, vertical: 20.h),
      decoration: BoxDecoration(
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
          PrimaryText(cardNumber,
            color: Colors.white, fontSize: 20.sp,),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryText(cardHolderName,color: Colors.white,fontWeight:FontWeight.w600,),
            ],
          ),
         20.height,
          Row(
            children: [
              Column(
                children: [
                  PrimaryText('Exp Date',color: ColorManager.white,fontSize: 10.sp,),
                  PrimaryText(expiryDate,color: ColorManager.white,fontSize: 12.sp,),
                ],
              ),
              20.width,
              Column(
                children: [
                  PrimaryText('CVV',color: ColorManager.white,fontSize: 10.sp,),
                  PrimaryText(cvv,color: ColorManager.white,fontSize: 12.sp,),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  SvgPicture.asset(IconAssets.master_card),
                  6.height,
                  PrimaryText(cardType,color: ColorManager.white,fontSize: 11.sp,),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
