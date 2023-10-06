import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryAlert extends StatelessWidget {
  const PrimaryAlert({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Widget content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      titlePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      title: content,
    );
  }
}
