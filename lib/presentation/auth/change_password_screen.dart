import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/controller/auth_provider.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/common_widget/primary_textfiled.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/extensions/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../config/routes/routes.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../core/common_widget/primary_button.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  GlobalKey<FormState>? formKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const PrimaryAppBar(title: 'Change Password',withLeading: true,),

        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    PrimaryText(
                      'Current Password',
                      fontSize: 14.sp,
                      color: ColorManager.secondaryText,
                    ),
                    4.height,
                    PrimaryTextField(
                      controller: emailController,
                      validator: (value) {
                        return value!.isValidEmail;
                      },
                      prefixIcon: SvgPicture.asset(
                        IconAssets.password,

                      ),
                    ),
                    PrimaryText(
                      'New Password',
                      fontSize: 14.sp,
                      color: ColorManager.secondaryText,
                    ),
                    4.height,
                    PrimaryTextField(
                      obscureText: loginProvider.isPasswordVisible,
                      controller: passwordController,
                      validator: (value) {
                        return value!.isValidPassword;
                      },
                      prefixIcon: SvgPicture.asset(
                        IconAssets.password,
                        width: 20.w,
                        height: 20.h,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () =>
                            loginProvider.togglePasswordVisibility(),
                        icon: loginProvider.isPasswordVisible
                            ? Icon(
                          Icons.visibility_outlined,
                          size: 22,
                          color: ColorManager.secondaryText,
                        )
                            : Icon(
                          Icons.visibility_off_outlined,
                          size: 22,
                          color: ColorManager.secondaryText,
                        ),
                      ),
                    ),

                    PrimaryText(
                      'Confirm New Password',
                      fontSize: 14.sp,
                      color: ColorManager.secondaryText,
                    ),
                    4.height,
                    PrimaryTextField(
                      obscureText: loginProvider.isPasswordVisible,
                      controller: passwordController,
                      validator: (value) {
                        return value!.isValidPassword;
                      },
                      prefixIcon: SvgPicture.asset(
                        IconAssets.password,
                        width: 20.w,
                        height: 20.h,
                      ),

                    ),
                    40.height,
                    AbsorbPointer(
                      absorbing: loginProvider.isLoading,
                      child: PrimaryButton(
                        color: loginProvider.isLoading
                            ? ColorManager.secondaryText
                            : ColorManager.primary,
                        width: double.infinity,
                        height: 56.h,
                        onPressed: () => sl<NavigationService>().pop(),
                        isDisable: loginProvider.isLoading,
                        child:  PrimaryText(
                          'Change Password',
                          color: ColorManager.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
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
