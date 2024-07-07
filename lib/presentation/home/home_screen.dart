import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/model/transaction_model.dart';
import 'package:dakakeen/presentation/home/profile_section.dart';
import 'package:dakakeen/presentation/home/transaction_buttons_section.dart';
import 'package:dakakeen/presentation/home/transactions_list_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              // BuildCardSection(),
              Image.asset(
                ImageAssets.card,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              30.height,
              const TransactionButtons(),
              20.height,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryText(
                    'Transaction',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  PrimaryText(
                    'See All',
                    color: ColorManager.primary,
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
