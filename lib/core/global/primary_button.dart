import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'primary_text.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.width = 90,
    this.height = 40,
    this.fontSize = 16,
    this.borderColor,
    this.isDisable = false,
  }) : super(key: key);
  final String? text;
  final Color? color;
  final double width;
  final double height;
  final double fontSize;
  final void Function()? onPressed;
  final Color? borderColor;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50.r),
          // border: borderColor != null
          // ? Border.all(
          //     color: borderColor!,
          //   )
          // : color == ColorManager.white
          //     ? Border.all(
          //         color: ColorManager.blue.withOpacity(0.7),
          //       )
          //     : null
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Center(
            child: isDisable
                ? Image.asset('assets/animation/loading_aimation.gif')
                : PrimaryText(
                    text!,
                    // color: color == ColorManager.white
                    //     ? ColorManager.blue.withOpacity(0.7)
                    //     : Colors.white,
                    fontSize: fontSize.sp,
                    height: 1,
                  ),
          ),
        ),
      ),
    );
  }
}
