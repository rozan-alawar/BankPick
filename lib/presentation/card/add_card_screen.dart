import 'dart:ui';

import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/controller/wallet_provider.dart';
import 'package:dakakeen/core/common_widget/primary_textfiled.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/extensions/validation.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:dakakeen/model/card_model.dart';
import 'package:dakakeen/presentation/home/card_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controller/home_provider.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_appbar.dart';
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
  GlobalKey<FormState>? formKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formKey = GlobalKey<FormState>();

    cardholderController = TextEditingController();
    expiryDateController = TextEditingController();
    cvvController = TextEditingController();
    cardnumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBody: true,
        appBar:  PrimaryAppBar(title:LocaleKeys.add_card.tr(),withLeading: true,),

        body: Form(
          key: formKey,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    BuildCardSection(
                      cardNumber: homeProvider.user!.cards[0].cardNumber,
                      cardHolderName: homeProvider.user!.cards[0].cardHolder,
                      expiryDate: homeProvider.user!.cards[0].expiryDate,
                      cvv: homeProvider.user!.cards[0].cvv,
                      cardType: homeProvider.user!.cards[0].cardType,
                    ),
                    30.height,
                     PrimaryText(
                      LocaleKeys.cardholder_name.tr(),
                      color: ColorManager.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                    PrimaryTextField(
                      controller: cardholderController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Cardhilder Name is required';
                        }
                      },
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
                               PrimaryText(
                                LocaleKeys.expiry_date.tr(),
                                color: ColorManager.secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
                              PrimaryTextField(
                                controller: expiryDateController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'expiry Date  is required';
                                  }
                                },
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
                                validator: (value) {
                                  print(value);
                                  if (value!.isEmpty) {
                                    return 'CVV is required';
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    10.height,
                     PrimaryText(
                      LocaleKeys.card_number.tr(),
                      color: ColorManager.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryTextField(
                            controller: cardnumberController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Card Number  is required';
                              }
                            },
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
                    PrimaryButton(
                      color: ColorManager.primary,
                      onPressed: () => sl<WalletProvider>().addCard(
                          formkey: formKey!,
                          newCard: CardModel(
                              cardNumber:
                                  cardnumberController?.text ?? "hhhhhhh",
                              cardHolder: cardholderController!.text,
                              expiryDate: expiryDateController!.text,
                              cvv: cvvController!.text,
                              cardType: 'Mastercard')),
                      child:  PrimaryText(
                        LocaleKeys.add_card.tr(),
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                    20.height,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
