import 'package:dakakeen/config/routes/routes.dart';
import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/controller/home_provider.dart';
import 'package:dakakeen/core/common_widget/primary_button.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/presentation/home/card_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 20.height,
              Row(
                children: [
                  GestureDetector(
                    onTap: () => sl<NavigationService>().pop(),
                    child: CircularCard(
                      widget: SvgPicture.asset(
                        IconAssets.arrow_back,
                        color: Colors.black,
                      ),
                      width: 45,
                      height: 45,
                    ),
                  ),
                  100.width,
                  PrimaryText(
                    'All Cards ',
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ],
              ),
              40.height,
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
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
                  'Add Card +',
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
