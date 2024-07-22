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
import '../../core/common_widget/primary_button.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      validator: (value) {
                        loginProvider.setEmail(value!);
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
                      'Password',
                      fontSize: 14.sp,
                      color: ColorManager.secondaryText,
                    ),
                    16.height,
                    PrimaryTextField(
                      obscureText: loginProvider.isPasswordVisible,
                      controller: passwordController,
                      validator: (value) {
                        loginProvider.setPassword(value!);
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
                    40.height,
                    AbsorbPointer(
                      absorbing: loginProvider.isLoading,
                      child: PrimaryButton(
                        color: loginProvider.isLoading
                            ? ColorManager.secondaryText
                            : ColorManager.primary,
                        width: double.infinity,
                        height: 56.h,
                        onPressed: () => loginProvider.login(formKey: formKey!, email: emailController!.text, password: passwordController!.text),
                        isDisable: loginProvider.isLoading,
                        child: PrimaryText(
                          'Sign In',
                          color: ColorManager.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    40.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryText(
                          'I’m a new user.',
                          color: ColorManager.secondaryText,
                        ),
                        GestureDetector(
                          onTap: () {
                            sl<AuthProvider>().togglePages();
                            print("object");
                          },
                          child: PrimaryText(
                            ' Sign up',
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
