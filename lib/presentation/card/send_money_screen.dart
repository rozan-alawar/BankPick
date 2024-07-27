import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/model/reciver_model.dart';
import 'package:dakakeen/presentation/card/money_amount_section.dart';
import 'package:dakakeen/presentation/home/card_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../config/routes/routes.dart';
import '../../controller/home_provider.dart';
import '../../controller/service_provider.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../core/common_widget/primary_button.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  TextEditingController? currencyController;
  GlobalKey<FormState>? formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    currencyController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Send Money',
        withLeading: true,
      ),
      body: Form(
        key: formKey,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List<Widget>.generate(
                        homeProvider.user!.cards.length, (index) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: index == 0 ? 20.w : 6.w,
                            end: index == homeProvider.user!.cards.length - 1
                                ? 20.w
                                : 6.w),
                        child: Container(
                          height: 240.h,
                          width: 320.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: BuildCardSection(
                            cardNumber:
                                homeProvider.user!.cards[index].cardNumber,
                            cardHolderName:
                                homeProvider.user!.cards[index].cardHolder,
                            expiryDate:
                                homeProvider.user!.cards[index].expiryDate,
                            cvv: homeProvider.user!.cards[index].cvv,
                            cardType: homeProvider.user!.cards[index].cardType,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                30.height,
                Container(
                  height: 160.h,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      color: sl<ServiceProvider>().isDark
                          ? Colors.black.withOpacity(0.3)
                          : Colors.black.withOpacity(0.4),
                    ),
                    color: sl<ServiceProvider>().isDark
                        ? Colors.black.withOpacity(0.3)
                        : Colors.white.withOpacity(0.8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PrimaryText(
                        'Send to',
                        fontWeight: FontWeight.w500,
                      ),
                      12.height,
                      Expanded(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () => sl<NavigationService>()
                                      .navigateTo(Routes.add_new_reciver),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: ColorManager.primary,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: ColorManager.primary,
                                    ),
                                  ),
                                ),
                                6.height,
                                PrimaryText(
                                  'Add',
                                  fontSize: 13.sp,
                                ),
                              ],
                            ),
                            12.width,
                            Expanded(
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: ReciverModel.recivers.length,
                                separatorBuilder: (context, index) => 12.width,
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        ///////////////////////////////////////////////
                                      },
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(ReciverModel
                                                  .recivers[index].avatarUrl),
                                              fit: BoxFit.cover),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    6.height,
                                    PrimaryText(
                                      ReciverModel.recivers[index].firstName,
                                      fontSize: 13.sp,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                20.height,
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),                  child: MoneyAmountSection(
                    currencyController: currencyController!,
                    validator: (value) {
                      return value??"";
                    },
                  ),
                ),
                40.height,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: PrimaryButton(
                    color: ColorManager.primary,
                    onPressed: () => sl<NavigationService>().pop(),
                    child: PrimaryText(
                      'Send Money',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                20.height
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    currencyController!.dispose();
    super.dispose();
  }
}
