import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            Row(
              children: [
                GestureDetector(
                  onTap: () => sl<NavigationService>().pop(),
                  child: CircularCard(
                    widget: SvgPicture.asset(IconAssets.arrow_back, color: Colors.black, ),
                    width: 45.w,
                    height: 45.h,
                  ),
                ),
                80.width,
                PrimaryText(
                  'Add New Card ',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),

              ],
            ),
            40.height,
Image.asset(ImageAssets.card ,fit: BoxFit.fitWidth, width: double.infinity,),
          ],
        ),
      ),
    );
  }
}
