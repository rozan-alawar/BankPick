import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
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
        separatorBuilder: (context, index) => 30.width,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    )
                  ],
                  color: Color(0xffF4F4F4),
                  borderRadius: BorderRadius.circular(50.r)),
              child: Center(
                  child: SvgPicture.asset(
                transactionnButtonIcons[index],
                height: 24.h,
                   width: 24.w,
              )),
            ),
            8.height,
            PrimaryText(
              transactionnButtonLable[index],
              // fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
          ],
        ),
      ),
    );
  }
}
