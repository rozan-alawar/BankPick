import 'package:dakakeen/config/routes/routes.dart';
import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/config/theme/theme_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/utils/navigation.dart';
import 'package:dakakeen/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controller/home_provider.dart';
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
              radius: 40.r,
              backgroundImage:AssetImage(
                homeProvider.user!.avatarUrl,
              ), // Add a profile image in assets folder
            ),
            16.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText('Welcome back,',
                    fontSize: 12.sp, color: ColorManager.secondaryText),
                PrimaryText(homeProvider.user?.name??"Rozan AbuAlawar",
                    fontSize: 18, fontWeight: FontWeight.bold),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => sl<NavigationService>().navigateTo(Routes.search),
              child: CircularCard(
                width: 40.w,
                height: 40.h,
                widget: SvgPicture.asset(IconAssets.search,color:Provider.of<HomeProvider>(context).getTheme() == ThemeDataStyle.light? Colors.black : Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
