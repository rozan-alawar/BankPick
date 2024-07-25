import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_appbar.dart';
import 'package:dakakeen/model/transaction_model.dart';
import 'package:dakakeen/presentation/home/transaction_history_screen.dart';
import 'package:dakakeen/presentation/home/transactions_list_section.dart';
import 'package:flutter/material.dart';
import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/common_widget/circular_card.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<TransactionModel> transactions = TransactionModel.transactions;
  List<TransactionModel> filteredTransactions = [];
  @override
  void initState() {
    super.initState();
    filteredTransactions = transactions;
  }

  void filterTransaction(String query) {
    final filtered = transactions.where((transaction) {
      final transactionName = transaction.title.toLowerCase();
      final input = query.toLowerCase();
      return transactionName.contains(input);
    }).toList();

    setState(() {
      filteredTransactions = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "Search",withLeading: true,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: filterTransaction,
              decoration: InputDecoration(

                hintText: ' Search ',
                prefixIcon: SvgPicture.asset(IconAssets.search,
                    color: ColorManager.secondaryText),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),

              ),
            ),
            30.height,
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => 16.height,
                itemCount: filteredTransactions.length,
                itemBuilder: (context, index) {
                  final transaction = filteredTransactions[index];
                  return Row(
                    children: [
                      CircularCard(
                        widget: Icon(transaction.icon),
                      ),
                      17.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            transaction.title,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                          6.height,
                          PrimaryText(
                            transaction.subtitle,
                            color: ColorManager.secondaryText,
                          ),
                        ],
                      ),
                      const Spacer(),
                      PrimaryText(
                        transaction.amount,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
