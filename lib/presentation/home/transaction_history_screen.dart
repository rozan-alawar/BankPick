import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:dakakeen/presentation/home/transactions_list_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/theme/assets_manager.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
        child: Column(children: [
          20.height,
          Row(
            children: <Widget>[
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
                LocaleKeys.transaction_history.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
              const Spacer(),
              CircularCard(
                widget: SvgPicture.asset(
                  IconAssets.arrow_back,
                  color: Colors.black,
                ),
                width: 45.w,
                height: 45.h,
              ),
            ],
          ),
          40.height,
          const TransactionsListSection(),
        ]),
      ),
    );
  }
}
