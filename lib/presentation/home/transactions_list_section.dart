import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/model/transaction_model.dart';
import 'package:dakakeen/presentation/home/profile_section.dart';
import 'package:dakakeen/presentation/home/transaction_buttons_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controller/home_provider.dart';
import '../../core/common_widget/circular_card.dart';
import 'card_section.dart';
class TransactionsListSection extends StatelessWidget {
  const TransactionsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: TransactionModel.transactions.length,
      separatorBuilder: (context, index) => 22.height,
      itemBuilder: (context, index) => Row(
        children: [
          CircularCard(
            widget: Icon(TransactionModel.transactions[index].icon,color: Colors.black,),
          ),
          17.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                TransactionModel.transactions[index].title,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
              6.height,
              PrimaryText(
                TransactionModel.transactions[index].subtitle,
                color: ColorManager.secondaryText,
              ),
            ],
          ),
          const Spacer(),
          PrimaryText(
            TransactionModel.transactions[index].amount,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ],
      ),
    );
  }
}
