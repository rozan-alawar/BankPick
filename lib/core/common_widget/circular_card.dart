import 'package:dakakeen/config/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/home_provider.dart';

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
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 4),
            )
          ],
          color:Provider.of<HomeProvider>(context).getTheme()==ThemeDataStyle.light? Color(0xffF4F4F4): Color(0xff1E1E2D),
          borderRadius: BorderRadius.circular(50.r)),
      child: Center(
        child:widget,
      ),
    );
  }
}
