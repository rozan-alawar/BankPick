import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/config/theme/theme_manager.dart';
import 'package:dakakeen/core/common_widget/circular_card.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/presentation/home/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controller/home_provider.dart';
import '../../controller/service_provider.dart';
import '../../injection_container.dart';

class TransactionButtons extends StatelessWidget {
  const TransactionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider =Provider.of<HomeProvider>(context);

    List transactionnButtonIcons = [
      IconAssets.sentLight,
      IconAssets.receiveLight,
      IconAssets.loanLight,
      IconAssets.topupLight
    ];
    List transactionnButtonIconsDark = [
      IconAssets.sentDark,
      IconAssets.receiveDark,
      IconAssets.loanDark,
      IconAssets.topupDark
    ];
    List transactionnButtonLable = ["Sent", "Receive", "Loan", "Top-up"];
    return SizedBox(
      height: 110.h,
      child: ListView.separated(
        separatorBuilder: (context, index)=>const SizedBox(),
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
         padding:  EdgeInsetsDirectional.only(start: index==0?10.w:20.w,end:index==transactionnButtonLable.length-1?10.w:20.w, ),
          child: Column(
            children: [
              CircularCard(
                width: 60,
                height: 60,
                widget: Center(
                    child: SvgPicture.asset(
                      color:sl<ServiceProvider>().isDark??false?Colors.white:Colors.black,
                      transactionnButtonIconsDark[index]   ,

                )),
              ),
              12.height,
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
