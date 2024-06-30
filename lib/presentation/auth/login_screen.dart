import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/common_widget/primary_textfiled.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/common_widget/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
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
                prefixIcon: SvgPicture.asset(
                  IconAssets.email,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              20.height,
              PrimaryText(
                'Password',
                fontSize: 14.sp,
                color: ColorManager.secondaryText,
              ),
              16.height,
              PrimaryTextField(
                controller: passwordController,
                validator: (value) {},
                prefixIcon: SvgPicture.asset(
                  IconAssets.password,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              40.height,

              PrimaryButton(
                color: ColorManager.primary,
                width: double.infinity,
                height: 56.h,
                onPressed: () {},
                child: PrimaryText(
                  'Sign In',
                  color: ColorManager.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              40.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryText(
                    'I’m a new user.',
                    color: ColorManager.secondaryText,
                  ),PrimaryText(
                    ' Sign In',
                    color: ColorManager.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }
}
