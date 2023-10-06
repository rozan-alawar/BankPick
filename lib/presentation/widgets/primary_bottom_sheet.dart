import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 24.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        // color: ColorManager.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // PrimaryText(
              //   title,
              //   color: ColorManager.blue,
              //   fontWeight: FontWeight.w700,
              // ),
              GestureDetector(
                // onTap: () => Get.back(),
                child: SvgPicture.asset('assets/icons/close.svg'),
              ),
            ],
          ),
          content
        ],
      ),
    );
  }
}
