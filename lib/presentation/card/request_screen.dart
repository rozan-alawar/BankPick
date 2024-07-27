import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/controller/wallet_provider.dart';
import 'package:dakakeen/core/common_widget/primary_textfiled.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/extensions/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/common_widget/primary_appbar.dart';
import '../../core/common_widget/primary_button.dart';
import '../../core/common_widget/primary_text.dart';
import 'money_amount_section.dart';

class RequestMoneyScreen extends StatefulWidget {
  const RequestMoneyScreen({super.key});

  @override
  State<RequestMoneyScreen> createState() => _RequestMoneyScreenState();
}

TextEditingController? nameController;
TextEditingController? descriptionController;
TextEditingController? emailController;
GlobalKey<FormState>? formKey;
TextEditingController? amountController;
DateTime dueDate = DateTime.now();
String currency = "USD";

class _RequestMoneyScreenState extends State<RequestMoneyScreen> {
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    emailController = TextEditingController();
    amountController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Request Money',
        withLeading: true,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PrimaryText(
                    'Payer Name',
                    color: ColorManager.secondaryText,
                  ),
                  PrimaryTextField(
                    controller: nameController,
                    validator: (value) {
                      return value!.isValidName;
                    },
                    prefixIcon: SvgPicture.asset(
                      IconAssets.user,
                      width: 16.w,
                      height: 16.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  12.height,
                  const PrimaryText(
                    'Email Address',
                    color: ColorManager.secondaryText,
                  ),
                  PrimaryTextField(
                    controller: emailController,
                    validator: (value) {
                      return value!.isValidEmail;
                    },
                    prefixIcon: SvgPicture.asset(
                      IconAssets.email,
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  12.height,
                  // 20.height,
                  const PrimaryText(
                    'Description',
                    color: ColorManager.secondaryText,
                  ),
                  8.height,
                  PrimaryTextField(
                    controller: descriptionController,
                    validator: (value) {
                      return null;
                    },
                    // multiLines: true,
                    multiLines: true,
                  ),
                  MoneyAmountSection(
                    currencyController: amountController!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an amount';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid amount';
                      }else{
                        return value;
                      }

                    },
                  ),
                  60.height,
                  PrimaryButton(
                    color: ColorManager.primary,
                    onPressed: () => walletProvider.requestMoneyFromFriend(
                      email: emailController!.text,
                      formKey: formKey!,
                      amount: double.tryParse(amountController!.text) ?? 0,
                      description: descriptionController!.text,
                      payerName: nameController!.text,
                      currency: currency,
                      date: dueDate,
                    ),
                    child: PrimaryText(
                      'Request Money',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController!.dispose();
    emailController!.dispose();
    descriptionController!.dispose();
    amountController!.dispose();
    super.dispose();
  }
}
