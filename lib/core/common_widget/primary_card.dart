import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PrimaryCard extends StatelessWidget {
  const PrimaryCard(
    this.text, {
    super.key,
    this.width = 75,
    this.height = 40,
    this.color,
    this.bgColor = Colors.white,
    this.withBorder = false,
    this.fontsize = 16,
  });

  final double width;
  final double height;
  final String text;
  final Color? color;
  final Color? bgColor;
  final bool withBorder;
  final double fontsize;
  // final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        // border: withBorder
        //     ? Border.all(color: ColorManager.unSelectedBorder)
        //     : null,
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: PrimaryText(
          text,
          // color: bgColor == ColorManager.primary ? ColorManager.white : color,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          fontSize: fontsize,
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.child,
    this.width = 115,
    this.borderColor,
    this.padding,
    this.borderWidth,
  }) : super(key: key);

  final Widget child;
  final double width;
  final double? borderWidth;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(24.r),
        // color: ColorManager.white,
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth ?? 1)
            : null,
      ),
      child: child,
    );
  }
}
