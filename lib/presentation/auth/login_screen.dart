import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/common_widget/primary_textfiled.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.height,
            PrimaryText(
              'Sign In',
              fontSize: 35.sp,
              fontWeight: FontWeight.w500,
            ),
            40.height,
            PrimaryText(
              'Email Address',
              fontSize: 14.sp,
              color: ColorManager.secondaryText,
            ),
            16.height,
            PrimaryTextField(
              controller: emailController,
              validator: (value) {},
              prefixIcon:SvgPicture.asset(IconAssets.email) ,
            )
          ],
        ),
      ),
    );
  }
}
