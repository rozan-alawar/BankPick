import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/controller/auth_provider.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../config/routes/routes.dart';
import '../../controller/service_provider.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../core/utils/cache_helper.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final serviceProvider = sl<ServiceProvider>();

    return Scaffold(
      appBar: PrimaryAppBar(
        title: LocaleKeys.settings.tr(),
        withLeading: false,
        action: [
          GestureDetector(
            onTap: () => sl<AuthProvider>().logout(),
            child: Transform.rotate(
              angle: serviceProvider.selectedLanguage == "Arabic" ? 3.2 : 0,
              child: CircularCard(
                widget: Icon(Icons.logout_rounded,
                    color: serviceProvider.isDark ?? false
                        ? Colors.white
                        : Colors.black),
                width: 45,
                height: 45,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                LocaleKeys.general.tr(),
                color: ColorManager.secondaryText,
              ),
              30.height,
              GestureDetector(
                onTap: () =>
                    sl<NavigationService>().navigateTo(Routes.language),
                child: Row(
                  children: [
                    PrimaryText(
                      LocaleKeys.language.tr(),
                      fontSize: 16.sp,
                    ),
                    const Spacer(),
                    const PrimaryText(
                      'English ',
                      color: ColorManager.secondaryText,
                    ),
                    16.width,
                    Transform.rotate(
                        angle: serviceProvider.selectedLanguage == "Arabic"
                            ? 0
                            : 3.2,
                        child: SvgPicture.asset(
                          IconAssets.arrow_back,
                          color: ColorManager.secondaryText,
                        )),
                  ],
                ),
              ),
              30.height,
              SectionTail(
                onTap: () => sl<NavigationService>().navigateTo(Routes.profile),
                text: LocaleKeys.my_profile.tr(),
              ),
              30.height,
              SectionTail(
                onTap: () =>
                    sl<NavigationService>().navigateTo(Routes.contact_us),
                text: LocaleKeys.contact_us.tr(),
              ),
              50.height,
              PrimaryText(
                LocaleKeys.security.tr(),
                color: ColorManager.secondaryText,
              ),
              30.height,
              SectionTail(
                onTap: () =>
                    sl<NavigationService>().navigateTo(Routes.change_password),
                text: LocaleKeys.change_password.tr(),
              ),
              30.height,
              SectionTail(
                onTap: () =>
                    sl<NavigationService>().navigateTo(Routes.term_condition),
                text: LocaleKeys.privacy_policy.tr(),
              ),
              50.height,
              PrimaryText(
                LocaleKeys.choose_what_data_you_share_with_us.tr(),
                color: ColorManager.secondaryText,
              ),
              30.height,
              Row(
                children: [
                  PrimaryText(
                    LocaleKeys.biometric.tr(),
                    fontSize: 16.sp,
                  ),
                  const Spacer(),
                  Switch(
                    value: false,
                    onChanged: (value) {},
                  )
                ],
              ),
              30.height,
              Row(
                children: [
                  PrimaryText(
                    LocaleKeys.dark_mode.tr(),
                    fontSize: 16.sp,
                  ),
                  const Spacer(),
                  Switch(
                    value:
                        Provider.of<ServiceProvider>(context).getThemeValue(),
                    onChanged: (value) {
                      // print(                      CacheHelper.getData(key: 'isDark'));
                      CacheHelper.saveData(key: 'isDark', value: value);
                      Provider.of<ServiceProvider>(context, listen: false)
                          .changeTheme(isDark: value);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTail extends StatelessWidget {
  const SectionTail({super.key, required this.text, this.onTap});
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          PrimaryText(
            text,
            fontSize: 16.sp,
          ),
          const Spacer(),
          Transform.rotate(
              angle: serviceProvider.selectedLanguage == "Arabic" ? 0 : 3.2,
              child: SvgPicture.asset(
                IconAssets.arrow_back,
                color: ColorManager.secondaryText,
              )),
        ],
      ),
    );
  }
}
