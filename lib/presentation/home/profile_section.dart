import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controller/home_provider.dart';

class BuildProfileSection extends StatelessWidget {
  const BuildProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Row(
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundImage: AssetImage(
                ImageAssets.profile,
              ), // Add a profile image in assets folder
            ),
            16.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText('Welcome back,',
                    fontSize: 12.sp, color: ColorManager.secondaryText),
                PrimaryText(homeProvider.name,
                    fontSize: 18, fontWeight: FontWeight.bold),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(8),
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  )
                ],
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffF4F4F4),
              ),
              child: SvgPicture.asset(IconAssets.search),
            ),
          ],
        );
      },
    );
  }
}
