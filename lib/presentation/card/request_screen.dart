import 'package:flutter/material.dart';
import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_textfiled.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/extensions/validation.dart';
import 'package:dakakeen/model/card_model.dart';
import 'package:dakakeen/presentation/home/card_section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../config/routes/routes.dart';
import '../../controller/home_provider.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_button.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class RequestMoneyScreen extends StatefulWidget {
  const RequestMoneyScreen({super.key});

  @override
  State<RequestMoneyScreen> createState() => _RequestMoneyScreenState();
}

TextEditingController? nameController;
TextEditingController? descriptionController;
TextEditingController? emailController;
GlobalKey<FormState>? formKey;
TextEditingController? currencyController;




class _RequestMoneyScreenState extends State<RequestMoneyScreen> {
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    emailController = TextEditingController();
    currencyController = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.height,
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => sl<NavigationService>().pop(),
                        child: CircularCard(
                          widget: SvgPicture.asset(
                            IconAssets.arrow_back,
                            color: Colors.black,
                          ),
                          width: 45.w,
                          height: 45.h,
                        ),
                      ),
                      80.width,
                      PrimaryText(
                        'Request Money',
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ],
                  ),
                  40.height,
                  const PrimaryText(
                    'Payer Name',
                    color: ColorManager.secondaryText,
                  ),
                  PrimaryTextField(
                    controller: nameController,
                    validator: (value) {
                      return value!.isValidName;
                    },
                    prefixIcon: SvgPicture.asset(
                      IconAssets.user,
                      width: 16.w,
                      height: 16.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  // 20.height,
                  PrimaryText(
                    'Email Address',
                    color: ColorManager.secondaryText,
                  ),
                  PrimaryTextField(
                    controller: emailController,
                    validator: (value) {
                      return value!.isValidEmail;
                    },
                    prefixIcon: SvgPicture.asset(
                      IconAssets.email,
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  // 20.height,
                  const PrimaryText(
                    'Description',
                    color: ColorManager.secondaryText,
                  ),
                  PrimaryTextField(
                    controller: descriptionController,
                    validator: (value) {},
                    // multiLines: true,
                    multiLines: true,
                  ),
                  // 20.height,
                  Container(
                    // height: 180.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                        color: ColorManager.secondaryText,
                      ),
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: Column(
                      children: [
                        30.height,
                        Row(
                          children: [
                            PrimaryText(
                              'Enter Your Amount',
                              color: ColorManager.secondaryText,
                              fontSize: 11.sp,
                            ),
                            Spacer(),
                            PrimaryText(
                              'Change Currency',
                              color: Colors.red,
                              fontSize: 11.sp,
                            ),
                          ],
                        ),
                        // 20.height,
                        Row(
                          children: [
                            PrimaryText(
                              'USD',
                              color: Colors.lightBlue,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            16.width,
                            Column(
                              children: [
                                25.height,
                                SizedBox(
                                  height: 80.h,width: 200.w,
                                  child: PrimaryTextField(
                                    hintText: '2200.00',
                                    hintStyle: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textStyle:    TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    controller: currencyController,
                                    validator: (value) {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  60.height,
                  PrimaryButton(
                    color: ColorManager.primary,
                    onPressed: () =>
                        sl<NavigationService>().pop(),
                    child:  PrimaryText(
                      'Request Money',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
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
    // TODO: implement dispose
    nameController!.dispose();
    emailController!.dispose();
    descriptionController!.dispose();
    currencyController!.dispose();
    super.dispose();
  }
}
