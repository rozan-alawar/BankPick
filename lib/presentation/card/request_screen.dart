import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/common_widget/primary_textfiled.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/extensions/validation.dart';
import 'package:dakakeen/model/card_model.dart';
import 'package:dakakeen/presentation/home/card_section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../config/routes/routes.dart';
import '../../controller/home_provider.dart';
import '../../controller/wallet_provider.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../core/common_widget/primary_button.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';
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
      appBar:  PrimaryAppBar(title: LocaleKeys.request_money.tr(),withLeading: true,),

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

                   PrimaryText(
                    LocaleKeys.payer_name.tr(),
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
                  // 20.height,
                   PrimaryText(
                    LocaleKeys.email_address.tr(),
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
                  // 20.height,
                   PrimaryText(
                     LocaleKeys.description.tr(),
                    color: ColorManager.secondaryText,
                  ),
                  4.height,
                  PrimaryTextField(
                    controller: descriptionController,
                    validator: (value) {},
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
                      }
                      return "";
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
                    child:  PrimaryText(
                      LocaleKeys.request_money.tr()  ,
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
