import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/controller/auth_provider.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../config/routes/routes.dart';
import '../../controller/home_provider.dart';
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
        title: 'Settings',
        withLeading: false,
        action: [
          GestureDetector(
            onTap: () =>     sl<AuthProvider>().logout(),
            child: CircularCard(
              widget:  Icon(Icons.logout_rounded,color:serviceProvider.isDark??false?Colors.white:Colors.black ),
              width: 45,
              height: 45,
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
              const PrimaryText(
                'General',
                color: ColorManager.secondaryText,
              ),
              30.height,
              GestureDetector(
                onTap: () =>
                    sl<NavigationService>().navigateTo(Routes.language),
                child: Row(
                  children: [
                    PrimaryText(
                      'Language ',
                      fontSize: 16.sp,
                    ),
                    const Spacer(),
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
                    const Spacer(),
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
                onTap: () =>
                    sl<NavigationService>().navigateTo(Routes.contact_us),
                child: Row(
                  children: [
                    PrimaryText(
                      'Contact Us ',
                      fontSize: 16.sp,
                    ),
                    const Spacer(),
                    Transform.rotate(
                        angle: 3.2,
                        child: SvgPicture.asset(
                          IconAssets.arrow_back,
                          color: ColorManager.secondaryText,
                        )),
                  ],
                ),
              ),
              50.height,
              const PrimaryText(
                'Security',
                color: ColorManager.secondaryText,
              ),
              30.height,
              GestureDetector(
                onTap: () =>
                    sl<NavigationService>().navigateTo(Routes.change_password),
                child: Row(
                  children: [
                    PrimaryText(
                      'Change Password ',
                      fontSize: 16.sp,
                    ),
                    const Spacer(),
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
                onTap: () =>
                    sl<NavigationService>().navigateTo(Routes.term_condition),
                child: Row(
                  children: [
                    PrimaryText(
                      'Privacy Policy ',
                      fontSize: 16.sp,
                    ),
                    const Spacer(),
                    Transform.rotate(
                        angle: 3.2,
                        child: SvgPicture.asset(
                          IconAssets.arrow_back,
                          color: ColorManager.secondaryText,
                        )),
                  ],
                ),
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
                    'Dark Mode',
                    fontSize: 16.sp,
                  ),
                  const Spacer(),
                  Switch(
                    value: Provider.of<ServiceProvider>(context).getThemeValue(),
                    onChanged: (value) {
                      // print(                      CacheHelper.getData(key: 'isDark'));
                      CacheHelper.saveData(key: 'isDark',value: value);
                      Provider.of<ServiceProvider>(context,listen: false).changeTheme(isDark: value);
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
