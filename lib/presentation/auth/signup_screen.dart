import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/controller/auth_provider.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/common_widget/primary_textfiled.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/extensions/validation.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/common_widget/primary_button.dart';
import '../../injection_container.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  GlobalKey<FormState>? formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  40.height,
                  PrimaryText(
                    LocaleKeys.sign_up.tr(),
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w500,
                  ),

                  40.height,
                  PrimaryText(
                    LocaleKeys.full_name.tr(),
                    fontSize: 14.sp,
                    color: ColorManager.secondaryText,
                  ),
                  16.height,
                  PrimaryTextField(
                    controller: nameController,
                    validator: (value) {
                      return value!.isValidName;
                    },
                    prefixIcon: SvgPicture.asset(
                      IconAssets.user,
                      width: 20.w,
                      height: 20.h,
                    ),

                  ),
                  20.height,

                  PrimaryText(
                    LocaleKeys.phone_number.tr(),
                    fontSize: 14.sp,
                    color: ColorManager.secondaryText,
                  ),
                  16.height,
                  PrimaryTextField(
                    controller: phoneController,
                    validator: (value) {
                      return value!.isValidName;
                    },
                    prefixIcon: SvgPicture.asset(
                      IconAssets.phone,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  20.height,
                  PrimaryText(
                    LocaleKeys.email_address.tr(),
                    fontSize: 14.sp,
                    color: ColorManager.secondaryText,
                  ),
                  16.height,
                  PrimaryTextField(
                    controller: emailController,
                    validator: (value) {

                      return value!.isValidEmail;
                    },
                    prefixIcon: SvgPicture.asset(
                      IconAssets.email,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  20.height,
                  PrimaryText(
                    LocaleKeys.password.tr(),
                    fontSize: 14.sp,
                    color: ColorManager.secondaryText,
                  ),
                  16.height,
                  PrimaryTextField(
                    obscureText: registerProvider.isPasswordVisible,

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
                      onPressed: () => registerProvider.togglePasswordVisibility(),
                      icon:registerProvider.isPasswordVisible?const Icon(Icons.visibility_outlined,size: 22,color: ColorManager.secondaryText,):const Icon(Icons.visibility_off_outlined,size: 22,color: ColorManager.secondaryText,),
                    ),

                  ),
                  40.height,
                  AbsorbPointer(
                    absorbing: registerProvider.isLoading,
                    child: PrimaryButton(
                      color:registerProvider.isLoading?ColorManager.secondaryText: ColorManager.primary,
                      width: double.infinity,
                      height: 56.h,
                      onPressed: () => registerProvider.signup(formKey:formKey!,email:emailController!.text,password: passwordController!.text,fullName: nameController!.text,phoneNumber: phoneController!.text),
                      isDisable: registerProvider.isLoading,
                      child:   PrimaryText(
                        LocaleKeys.sign_up.tr(),
                        color: ColorManager.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       PrimaryText(
                        LocaleKeys.i_am_a_new_user.tr(),
                        color: ColorManager.secondaryText,
                      ),
                      GestureDetector(
                        onTap: () =>   sl<AuthProvider>().togglePages(),
                        child:  PrimaryText(
                          LocaleKeys.sign_in.tr(),
                          color: ColorManager.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController!.dispose();
    phoneController!.dispose();
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }
}
