import 'package:dakakeen/config/routes/routes.dart';
import 'package:dakakeen/controller/home_provider.dart';
import 'package:dakakeen/core/common_widget/primary_appbar.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:dakakeen/presentation/home/profile_section.dart';
import 'package:dakakeen/presentation/profile/payment_preferance.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../config/theme/assets_manager.dart';
import '../../config/theme/color_manager.dart';
import '../../controller/service_provider.dart';
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
        title:LocaleKeys.profile.tr(),
        withLeading: true,
        action: [
          GestureDetector(
            onTap: () =>
                sl<NavigationService>().navigateTo(Routes.edit_profile),
            child: CircularCard(
              widget: SvgPicture.asset(
                IconAssets.edit_profile,
                color: sl<ServiceProvider>().isDark
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
          children: [
            Expanded(
                flex: 20,
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
                            PrimaryText(LocaleKeys.full_name.tr(),
                                fontSize: 12.sp, color: ColorManager.secondaryText),
                            PrimaryText(homeProvider.user?.name ?? "Rozan AbuAlawar",
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ],
                        ),
                      ],
                    ),
                    30.height,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryText(
                          LocaleKeys.email_address.tr(),
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
                          LocaleKeys.phone_number.tr(),
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
                          LocaleKeys.birth_day.tr(),
                          fontSize: 12.sp,
                          color: ColorManager.secondaryText,
                        ),
                        8.height,
                        PrimaryText(
                          ConvertDate.dateToString(homeProvider.user!.birthDate) ?? "0147822368",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    30.height,
                    InfoTile(
                      icon: IconAssets.credit_cards,
                      title: LocaleKeys.payment_preferences.tr(),
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
                    InfoTile(icon: IconAssets.user, title:LocaleKeys.bank_and_cards.tr()),
                    40.height,
                    InfoTile(
                      icon: IconAssets.notification,
                      title:LocaleKeys.notifications.tr(),
                      onTap: () =>
                          sl<NavigationService>().navigateTo(Routes.notification),
                    ),
                    40.height,
                    InfoTile(
                      icon: IconAssets.user,
                      title: LocaleKeys.message_center.tr(),
                      onTap: () =>
                          sl<NavigationService>().navigateTo(Routes.message_center),
                    ),
                  ],
                )
            ),
            Spacer(),
            Expanded(
              flex: 1,
                child: Column(
                  children: [
                    Center(
                      child: PrimaryText(
                        '${LocaleKeys.joined.tr()} ${homeProvider.user!.joinedDate.day}/${homeProvider.user!.joinedDate.month}/${homeProvider.user!.joinedDate.year}',
                        color: ColorManager.secondaryText,
                      ),
                    ),
                  ],
                )
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
