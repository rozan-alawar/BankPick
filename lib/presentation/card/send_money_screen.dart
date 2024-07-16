import 'package:flutter/material.dart';
import 'dart:ui';

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

import '../../controller/home_provider.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_button.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  TextEditingController? currencyController;
  GlobalKey<FormState>? formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    currencyController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Form(
        key: formKey,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 20.height,
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Row(
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
                        'Send Money',
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List<Widget>.generate(
                        homeProvider.user!.cards.length, (index) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: index == 0 ? 20.w : 6.w,
                            end: index == homeProvider.user!.cards.length - 1
                                ? 20.w
                                : 6.w),
                        child: Container(
                          height: 240.h,
                          width: 320.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: BuildCardSection(
                            cardNumber:
                                homeProvider.user!.cards[index].cardNumber,
                            cardHolderName:
                                homeProvider.user!.cards[index].cardHolder,
                            expiryDate:
                                homeProvider.user!.cards[index].expiryDate,
                            cvv: homeProvider.user!.cards[index].cvv,
                            cardType: homeProvider.user!.cards[index].cardType,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                30.height,
                Container(
                  height: 160.h,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      color: ColorManager.secondaryText,
                    ),
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PrimaryText(
                        'Send to',
                        fontWeight: FontWeight.w500,
                      ),
                      12.height,
                      Expanded(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: ColorManager.primary),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: ColorManager.primary,
                                    ),
                                  ),
                                ),
                                6.height,
                                PrimaryText(
                                  'Add',
                                  fontSize: 13.sp,
                                ),
                              ],
                            ),
                            12.width,
                            Expanded(
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                separatorBuilder: (context, index) => 12.width,
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        ///////////////////////////////////////////////
                                      },
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: ColorManager.primary),
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: ColorManager.primary,
                                        ),
                                      ),
                                    ),
                                    6.height,
                                    PrimaryText(
                                      'Add',
                                      fontSize: 13.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                20.height,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w),
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
                            fontSize: 12.sp,
                          ),
                          Spacer(),
                          PrimaryText(
                            'Change Currency',
                            color: Colors.red,
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                      10.height,
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
                40.height,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: PrimaryButton(
                    color: ColorManager.primary,
                    onPressed: () => sl<NavigationService>().pop(),
                    child: PrimaryText(
                      'Send Money',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                20.height
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    currencyController!.dispose();
    super.dispose();
  }
}
