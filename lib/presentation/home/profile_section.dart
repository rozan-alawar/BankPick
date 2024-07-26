import 'package:dakakeen/config/routes/routes.dart';
import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/config/theme/theme_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:dakakeen/core/utils/navigation.dart';
import 'package:dakakeen/injection_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controller/home_provider.dart';
import '../../controller/service_provider.dart';
import '../../core/common_widget/circular_card.dart';

class BuildProfileSection extends StatelessWidget {
  const BuildProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Row(
          children: [
            CircleAvatar(
              radius: 35.r,
              foregroundImage:AssetImage(
                homeProvider.user!.avatarUrl,

              ), // Add a profile imag
              // e in assets folder
            ),
            16.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(LocaleKeys.welcome_back.tr(),
                    fontSize: 12.sp, color: ColorManager.secondaryText),
                PrimaryText(homeProvider.user?.name??"Rozan AbuAlawar",
                    fontSize: 18, fontWeight: FontWeight.bold),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => sl<NavigationService>().navigateTo(Routes.search),
              child: CircularCard(
                width: 50,
                height: 50,
                widget: SvgPicture.asset(IconAssets.search,color:sl<ServiceProvider>().isDark? Colors.white : Colors.black,
                  width: 30,height: 30,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
