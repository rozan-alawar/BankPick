import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_button.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/presentation/home/card_section.dart';
import 'package:dakakeen/presentation/home/transactions_list_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../config/routes/routes.dart';
import '../../config/theme/assets_manager.dart';
import '../../controller/home_provider.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'My Card',withLeading: false,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                'Monthly Spending limit',
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
              20.height,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      'Amount: \$${homeProvider.spendingLimit.toStringAsFixed(2)}',
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                    Slider(
                      activeColor: ColorManager.primary,
                      value: homeProvider.spendingLimit,
                      min: 0,
                      max: 10000,
                      divisions: 100,
                      label: homeProvider.spendingLimit.round().toString(),
                      onChanged: (value) {
                        homeProvider.updateSpendingLimit(value);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$0', style: TextStyle(fontSize: 14.sp,color: Colors.black,)),
                        Text('\$4,600', style: TextStyle(fontSize: 14.sp,color: Colors.black,)),
                        Text('\$10,000', style: TextStyle(fontSize: 14.sp,color: Colors.black,)),
                      ],
                    ),
                  ],
                ),
              ),
              60.height,
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      color: ColorManager.primary,
                      onPressed: () =>
                          sl<NavigationService>().navigateTo(Routes.request),
                      child: PrimaryText(
                        'Request',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  20.width,
                  Expanded(
                    child: PrimaryButton(
                      color: ColorManager.primary,
                      onPressed: ()=> sl<NavigationService>().navigateTo(Routes.send),
                      child: PrimaryText(
                        'Send',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
