import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/config/theme/theme_manager.dart';
import 'package:dakakeen/core/common_widget/primary_button.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:dakakeen/presentation/home/card_section.dart';
import 'package:dakakeen/presentation/home/transactions_list_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../config/routes/routes.dart';
import '../../config/theme/assets_manager.dart';
import '../../controller/home_provider.dart';
import '../../controller/service_provider.dart';
import '../../controller/wallet_provider.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = sl<WalletProvider>();
    return Scaffold(
      appBar: PrimaryAppBar(
        title:LocaleKeys.my_card.tr(),
        withLeading: false,
        action: [
          GestureDetector(
            onTap: () => sl<NavigationService>().navigateTo(Routes.show_cards),
            child: CircularCard(
              widget: const Icon(Icons.add),
              width: 45,
              height: 45,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildCardSection(
              cardNumber: walletProvider.user!.cards[0].cardNumber,
              cardHolderName: walletProvider.user!.cards[0].cardHolder,
              expiryDate: walletProvider.user!.cards[0].expiryDate,
              cvv: walletProvider.user!.cards[0].cvv,
              cardType: walletProvider.user!.cards[0].cardType,
            ),
            30.height,
            PrimaryText(
              LocaleKeys.monthly_spending_limit.tr(),
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
            20.height,
            sl<ServiceProvider>().getTheme() ==
                    ThemeDataStyle.light
                ? Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.w, vertical: 20.h),
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
                          '${LocaleKeys.amount.tr()}: \$${ sl<WalletProvider>().spendingLimit.toStringAsFixed(2)}',
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                        Slider(
                          activeColor: ColorManager.primary,
                          value:  walletProvider.spendingLimit,
                          min: 0,
                          max: 10000,
                          divisions: 100,
                          label:
                          walletProvider.spendingLimit.round().toString(),
                          onChanged: (value) {
                            // walletProvider.updateSpendingLimit(value);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$0',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                )),
                            Text('\$4,600',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                )),
                            Text('\$10,000',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.w, vertical: 20.h),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ],
                      color: Color(0xff232533),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryText(
                          '${LocaleKeys.amount.tr()}: \$${walletProvider.spendingLimit.toStringAsFixed(2)}',
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                        Slider(
                          activeColor: Colors.white,
                          value: walletProvider.spendingLimit,
                          min: 0,
                          max: 10000,
                          divisions: 100,
                          label:
                          walletProvider.spendingLimit.round().toString(),
                          onChanged: (value) {
                            // walletProvider.updateSpendingLimit(value);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$0',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                )),
                            Text('\$4,600',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                )),
                            Text('\$10,000',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
            Expanded(child: Container()),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    color: ColorManager.primary,
                    onPressed: () =>
                        sl<NavigationService>().navigateTo(Routes.request),
                    child: PrimaryText(
                      LocaleKeys.request.tr(),
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
                    onPressed: () =>
                        sl<NavigationService>().navigateTo(Routes.send),
                    child: PrimaryText(
                      LocaleKeys.send.tr(),
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
    );
  }
}
