import 'package:dakakeen/config/routes/routes.dart';
import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/controller/home_provider.dart';
import 'package:dakakeen/core/common_widget/primary_button.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:dakakeen/presentation/home/card_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar:  PrimaryAppBar(title:LocaleKeys.my_card.tr(),withLeading: true,),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
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
              40.height,
              PrimaryButton(
                color: ColorManager.primary,
                onPressed: () =>
                    sl<NavigationService>().navigateTo(Routes.add_card),
                child:  PrimaryText(
                  '${LocaleKeys.add_card.tr()} +',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
