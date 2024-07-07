import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/routes/routes.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                PrimaryText(
                  'My Cards',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
                GestureDetector(
                  onTap: () => sl<NavigationService>().navigateTo(Routes.show_cards) ,
                  child: CircularCard(
                    widget: const Icon(Icons.add),
                    width: 45.w,
                    height: 45.h,
                  ),
                ),
              ],
            ),
            40.height,

          ],
        ),
      ),
    );
  }
}
