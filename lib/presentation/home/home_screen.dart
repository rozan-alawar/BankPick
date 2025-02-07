import 'package:dakakeen/config/routes/routes.dart';
import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:dakakeen/core/utils/navigation.dart';
import 'package:dakakeen/injection_container.dart';
import 'package:dakakeen/model/transaction_model.dart';
import 'package:dakakeen/presentation/home/profile_section.dart';
import 'package:dakakeen/presentation/home/transaction_buttons_section.dart';
import 'package:dakakeen/presentation/home/transactions_list_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controller/home_provider.dart';
import '../../core/common_widget/circular_card.dart';
import 'card_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              30.height,
              const BuildProfileSection(),
              32.height,
              BuildCardSection(
                cardNumber: homeProvider.user!.cards[0].cardNumber,
                cardHolderName: homeProvider.user!.cards[0].cardHolder,
                expiryDate: homeProvider.user!.cards[0].expiryDate,
                cvv: homeProvider.user!.cards[0].cvv,
                cardType: homeProvider.user!.cards[0].cardType,
              ),
              30.height,
              const TransactionButtons(),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   PrimaryText(
                    LocaleKeys.transaction.tr(),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  GestureDetector(
                    onTap: () => sl<NavigationService>()
                        .navigateTo(Routes.transaction_history),
                    child:  PrimaryText(
                      LocaleKeys.see_all.tr(),
                      color: ColorManager.primary,
                    ),
                  ),
                ],
              ),
              20.height,
              const TransactionsListSection(),
              20.height,
            ],
          ),
        ),
      ),
    );
  }
}
