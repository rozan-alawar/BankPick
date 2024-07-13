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

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Column(
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
                'Send Money',
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
            ],
          ),
          40.height,
          ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => BuildCardSection(
                    cardNumber: homeProvider.user!.cards[index].cardNumber,
                    cardHolderName: homeProvider.user!.cards[index].cardHolder,
                    expiryDate: homeProvider.user!.cards[index].expiryDate,
                    cvv: homeProvider.user!.cards[index].cvv,
                    cardType: homeProvider.user!.cards[index].cardType,
                  ),
              separatorBuilder: (context, index) => 20.height,
              itemCount: homeProvider.user!.cards.length),
        ],
      ),
    );
  }
}
