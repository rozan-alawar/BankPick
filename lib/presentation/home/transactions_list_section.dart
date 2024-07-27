import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/config/theme/theme_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/service_provider.dart';
import '../../core/common_widget/circular_card.dart';
import '../../injection_container.dart';
class TransactionsListSection extends StatelessWidget {
  const TransactionsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: TransactionModel.transactions.length,
      separatorBuilder: (context, index) => 22.height,
      itemBuilder: (context, index) => Row(
        children: [
          CircularCard(
            widget: Icon(TransactionModel.transactions[index].icon,color:
            sl<ServiceProvider>().getTheme() == ThemeDataStyle.light? Colors.black : Colors.white,
            ),
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
