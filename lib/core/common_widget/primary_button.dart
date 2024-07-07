import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.color,
    required this.onPressed,
    this.width,
    this.height ,
    this.fontSize = 16,
    this.borderColor,
    this.isDisable = false, required this.child,
  }) : super(key: key);
  final Color? color;
  final double? width;
  final double? height;
  final double fontSize;
  final void Function()? onPressed;
  final Color? borderColor;
  final bool isDisable;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width??double.infinity,
        height: height??60.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.r),
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
                ?  SpinKitThreeBounce(
              color: Colors.white,
              size: 20.0,
            )
                :child
          ),
        ),
      ),
    );
  }
}
