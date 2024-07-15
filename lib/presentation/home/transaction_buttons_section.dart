import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/circular_card.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/presentation/home/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TransactionButtons extends StatelessWidget {
  const TransactionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    List transactionnButtonIcons = [
      IconAssets.sent,
      IconAssets.receive,
      IconAssets.loan,
      IconAssets.topup
    ];
    List transactionnButtonLable = ["Sent", "Receive", "Loan", "Top-up"];
    return SizedBox(
      height: 110.h,
      child: ListView.separated(
        separatorBuilder: (context, index)=>SizedBox(),
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
         padding:  EdgeInsetsDirectional.only(start: index==0?10.w:22.w,end:index==transactionnButtonLable.length-1?10.w:22.w, ),
          child: Column(
            children: [
              CircularCard(
                widget: Center(
                    child: SvgPicture.asset(
                  transactionnButtonIcons[index],
                  height: 24.h,
                  width: 24.w,
                )),
              ),
              8.height,
              PrimaryText(
                transactionnButtonLable[index],
                fontSize: 13.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
