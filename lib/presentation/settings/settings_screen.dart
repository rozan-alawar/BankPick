import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/routes/routes.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                PrimaryText(
                  'Settings',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
                CircularCard(
                  widget: Icon(Icons.logout_rounded),
                  width: 45.w,
                  height: 45.h,
                ),
              ],
            ),
            40.height,
            const PrimaryText(
              'General',
              color: ColorManager.secondaryText,
            ),
            30.height,
            GestureDetector(
              onTap: () => sl<NavigationService>().navigateTo(Routes.language),
              child: Row(
                children: [
                  PrimaryText(
                    'Language ',
                    fontSize: 16.sp,
                  ),
                  Spacer(),
                  const PrimaryText(
                    'English ',
                    color: ColorManager.secondaryText,
                  ),
                  16.width,
                  Transform.rotate(
                      angle: 3.2,
                      child: SvgPicture.asset(
                        IconAssets.arrow_back,
                        color: ColorManager.secondaryText,
                      )),
                ],
              ),
            ),
            30.height,
            GestureDetector(
              onTap: () => sl<NavigationService>().navigateTo(Routes.profile),
              child: Row(
                children: [
                  PrimaryText(
                    'My Profile ',
                    fontSize: 16.sp,
                  ),
                  Spacer(),
                  Transform.rotate(
                      angle: 3.2,
                      child: SvgPicture.asset(
                        IconAssets.arrow_back,
                        color: ColorManager.secondaryText,
                      )),
                ],
              ),
            ),
            30.height,
            Row(
              children: [
                PrimaryText(
                  'Contact Us ',
                  fontSize: 16.sp,
                ),
                Spacer(),
                Transform.rotate(
                    angle: 3.2,
                    child: SvgPicture.asset(
                      IconAssets.arrow_back,
                      color: ColorManager.secondaryText,
                    )),
              ],
            ),
            50.height,
            const PrimaryText(
              'Security',
              color: ColorManager.secondaryText,
            ),
            30.height,
            Row(
              children: [
                PrimaryText(
                  'Change Password ',
                  fontSize: 16.sp,
                ),
                Spacer(),
                Transform.rotate(
                    angle: 3.2,
                    child: SvgPicture.asset(
                      IconAssets.arrow_back,
                      color: ColorManager.secondaryText,
                    )),
              ],
            ),
            30.height,
            Row(
              children: [
                PrimaryText(
                  'Privacy Policy ',
                  fontSize: 16.sp,
                ),
                Spacer(),
                Transform.rotate(
                    angle: 3.2,
                    child: SvgPicture.asset(
                      IconAssets.arrow_back,
                      color: ColorManager.secondaryText,
                    )),
              ],
            ),
            50.height,
            const PrimaryText(
              'Choose what data you share with us ',
              color: ColorManager.secondaryText,
            ),
            30.height,
            Row(
              children: [
                PrimaryText(
                  'Biometric  ',
                  fontSize: 16.sp,
                ),
                Spacer(),
                Switch(
                  value: false,
                  onChanged: (value) {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
