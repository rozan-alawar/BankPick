import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/routes/routes.dart';
import '../../config/theme/assets_manager.dart';
import '../../config/theme/color_manager.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class TermAndConditionScreen extends StatelessWidget {
  const TermAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  PrimaryText(
                    'Term & Condition',
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                  const SizedBox(),
                ],
              ),
              40.height,
              PrimaryText('''BankPick
              
 The BankPick is a mobile application designed to help users manage their finances efficiently. The app allows users to add, view, and manage their credit/debit cards, track transactions, and set spending limits. The app's main features include profile management, transaction tracking, card management, and detailed statistics.

 Features

Profile Management
Edit Profile: Users can update their profile information such as name, email address, phone number, and birth date.
View Profile: Displays user information including name, email, phone number, birth date, and the date they joined the app.

Card Management
Add New Card: Users can add new credit/debit cards with details like card number, cardholder name, expiry date, CVV, and card type.
View Cards: Displays a list of all the cards the user has added to their profile.
Card Details: Users can view details of individual cards.

Transaction Tracking
Add Transactions: Users can add transactions to track their spending.
View Transactions: Users can view a list of all transactions made with their cards.
Transaction Details: Provides detailed information about each transaction.

Spending Limit
Set Spending Limit: Users can set a spending limit to manage their finances better.
Update Spending Limit: Allows users to update their spending limit as needed.

Statistics
View Statistics: Users can view detailed statistics of their spending habits.
''',maxLines: 200,fontSize: 16.sp,)
            ],
          ),
        ),
      ),
    );
  }
}
