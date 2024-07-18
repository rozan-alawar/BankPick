import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/theme/assets_manager.dart';
import '../../injection_container.dart';
import '../utils/navigation.dart';
import 'circular_card.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget{
  const PrimaryAppBar({super.key, required this.withLeading,  this.action, required this.title});
final bool withLeading;
final List<Widget>? action;
final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90.h,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
       withLeading?   GestureDetector(
            onTap: () => sl<NavigationService>().pop(),
            child: CircularCard(
              widget: SvgPicture.asset(
                IconAssets.arrow_back,
                color: Colors.black,),
              width: 45,
              height: 45,
            ),
          ):const SizedBox(),
          PrimaryText(title,     fontWeight: FontWeight.w500,
            fontSize: 18.sp,),
          ...action??[const SizedBox()]
        ],
      ),
      automaticallyImplyLeading: false,

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 70.h);
}
