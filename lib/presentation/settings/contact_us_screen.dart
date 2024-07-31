import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:dakakeen/presentation/profile/message_bubble_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controller/profile_provider.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../core/common_widget/primary_text.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: PrimaryAppBar(
        title: LocaleKeys.contact_us.tr(),
        withLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  IconAssets.email,
                  width: 25.w,
                  height: 25.h,
                ),
                8.width,
                PrimaryText("Email",
                    fontSize: 14.sp, color: ColorManager.secondaryText),
              ],
            ),
            8.height,
            PrimaryText(
              "info@bankPick.ps",
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            25.height,
            Row(
              children: [
                SvgPicture.asset(
                  IconAssets.phone,
                  width: 25.w,
                  height: 25.h,
                ),
                8.width,
                PrimaryText("Phone Number",
                    fontSize: 14.sp, color: ColorManager.secondaryText),
              ],
            ),
            8.height,
            PrimaryText(
              "789456321",
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            30.height,
            PrimaryText("You can find us on social media ",
                fontSize: 14.sp, color: ColorManager.secondaryText),
16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.facebook,size: 40.h,),
                Icon(Icons.telegram,size: 40.h,),
                Icon(Icons.snapchat,size: 40.h,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
