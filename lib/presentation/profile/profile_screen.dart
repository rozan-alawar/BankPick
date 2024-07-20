import 'package:dakakeen/config/routes/routes.dart';
import 'package:dakakeen/controller/home_provider.dart';
import 'package:dakakeen/core/common_widget/primary_appbar.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/presentation/home/profile_section.dart';
import 'package:dakakeen/presentation/profile/payment_preferance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../config/theme/assets_manager.dart';
import '../../config/theme/color_manager.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/date_to_String.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Profile',
        withLeading: true,
        action: [
          GestureDetector(
            onTap: () =>
                sl<NavigationService>().navigateTo(Routes.edit_profile),
            child: CircularCard(
              widget: SvgPicture.asset(
                IconAssets.edit_profile,
                color: homeProvider.isDark
                    ? Colors.white
                    : Colors.black,              ),
              width: 45.w,
              height: 45.h,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundImage: AssetImage(
                    homeProvider.user!.avatarUrl,
                  ), // Add a profile image in assets folder
                ),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText('Full Name',
                        fontSize: 12.sp, color: ColorManager.secondaryText),
                    PrimaryText(homeProvider.user?.name ?? "Rozan AbuAlawar",
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ],
                ),
              ],
            ),
            30.height,
            PrimaryText(
              'Email Address',
              fontSize: 12.sp,
              color: ColorManager.secondaryText,
            ),
            8.height,
            PrimaryText(
              homeProvider.user?.email ?? "xyz@gmail.com",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            24.height,
            PrimaryText(
              'Phone Number',
              fontSize: 12.sp,
              color: ColorManager.secondaryText,
            ),
            8.height,
            PrimaryText(
              homeProvider.user?.phoneNumber ?? "0147822368",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            24.height,
            PrimaryText(
              'Birth Date',
              fontSize: 12.sp,
              color: ColorManager.secondaryText,
            ),
            8.height,
            PrimaryText(
              ConvertDate.dateToString(homeProvider.user!.birthDate) ?? "0147822368",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            30.height,

            InfoTile(
              icon: IconAssets.credit_cards,
              title: 'Payment Preferances',
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0)),
                ),
                builder: (context) => const PaymentPreferancesSection(),
              ),
            ),
            40.height,
            InfoTile(icon: IconAssets.user, title: 'Bank and Cards'),
            40.height,
            InfoTile(
              icon: IconAssets.notification,
              title: 'Notifications',
              onTap: () =>
                  sl<NavigationService>().navigateTo(Routes.notification),
            ),
            40.height,
            InfoTile(
              icon: IconAssets.user,
              title: 'Messages Center',
              onTap: () =>
                  sl<NavigationService>().navigateTo(Routes.message_center),
            ),
            100.height,
            Center(
              child: PrimaryText(
                'Joined ${homeProvider.user!.joinedDate.day}/${homeProvider.user!.joinedDate.month}/${homeProvider.user!.joinedDate.year}',
                color: ColorManager.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  InfoTile({super.key, required this.icon, required this.title, this.onTap});

  final String icon;
  final String title;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 26.w,
            height: 26.h,
            fit: BoxFit.cover,
          ),
          20.width,
          PrimaryText(
            title,
            fontSize: 16,
          ),
          Spacer(),
          Transform.rotate(
            angle: 3.2,
            child: SvgPicture.asset(
              IconAssets.arrow_back,
              color: ColorManager.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
