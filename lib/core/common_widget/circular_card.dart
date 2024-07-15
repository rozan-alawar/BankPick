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
      width:width?? 50,
      height:height?? 50,

      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 4),
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
