import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularCard extends StatelessWidget {
   CircularCard({super.key,required this.widget, this.width, this.height});

  double? width;
  double? height;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width:width?? 60.w,
      height:height?? 60.h,

      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 6,
              offset: Offset(0, 4),
            )
          ],
          color: const Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(50.r)),
      child: Center(
        child:widget,
      ),
    );
  }
}
