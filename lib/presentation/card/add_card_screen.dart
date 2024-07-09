import 'dart:ui';

import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_textfiled.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/presentation/home/card_section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_button.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  TextEditingController? cardholderController;
  TextEditingController? expiryDateController;
  TextEditingController? cvvController;
  TextEditingController? cardnumberController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardholderController = TextEditingController();
    expiryDateController = TextEditingController();
    cvvController= TextEditingController();
    cardnumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      FocusScope.of(context).unfocus();
    },
      child: Scaffold(
        extendBody: true,

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.height,
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
                      'Add New Card ',
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ],
                ),
                20.height,
               BuildCardSection(),
                30.height,
                const PrimaryText(
                  'Cardholder Name',
                  color: ColorManager.secondaryText,
                  fontWeight: FontWeight.w500,
                ),
                PrimaryTextField(
                  controller: cardholderController,
                  validator: (value) {},
                  prefixIcon: SvgPicture.asset(
                    IconAssets.user,
                    width: 12.w,
                    height: 12.h,
                  ),
                ),
                10.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const PrimaryText(
                            'Expiry Date',
                            color: ColorManager.secondaryText,
                            fontWeight: FontWeight.w500,
                          ),
                          PrimaryTextField(
                            controller: expiryDateController,
                            validator: (value) {},
                          ),
                        ],
                      ),
                    ),
                    60.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const PrimaryText(
                            '4-digit CVV',
                            color: ColorManager.secondaryText,
                            fontWeight: FontWeight.w500,
                          ),
                          PrimaryTextField(
                            controller: cvvController,
                            validator: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                10.height,
                const PrimaryText(
                  'Card Number',
                  color: ColorManager.secondaryText,
                  fontWeight: FontWeight.w500,
                ),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryTextField(
                        controller: cardnumberController,
                        validator: (value) {},
                        prefixIcon: SvgPicture.asset(
                          IconAssets.credit_cards,
                          width: 12.w,
                          height: 12.h,
                        ),
                      ),
                    ),
                    SvgPicture.asset(IconAssets.master_card),
                  ],
                ),
                60.height,
                PrimaryButton(color: ColorManager.primary, onPressed: () {} , child:  const PrimaryText('Add Card ', color: Colors.white,),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
