import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/controller/home_provider.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/presentation/home/transactions_list_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../config/routes/routes.dart';
import '../../config/theme/color_manager.dart';
import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../core/common_widget/primary_text.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider =Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar:  PrimaryAppBar(title: 'Statistics',withLeading: false,action: [ GestureDetector(
        onTap: () =>
            sl<NavigationService>().navigateTo(Routes.notification),
        child: CircularCard(
          widget: SvgPicture.asset(
            IconAssets.notification,color:homeProvider.isDark??false?Colors.white:Colors.black,
          ),
          width: 45,
          height: 45,
        ),
      ),],),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Column(
                  children: [
                    PrimaryText(
                      'Current Balance',
                      fontSize: 18.sp,
                      color: ColorManager.secondaryText,
                    ),
                    10.height,
                    PrimaryText(
                      '\$8,545.00',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              20.height,
              SizedBox(
                height: 200.h,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(drawBelowEverything: false),
                      topTitles: AxisTitles(drawBelowEverything: false),
                      rightTitles: AxisTitles(drawBelowEverything: false),

                      bottomTitles: AxisTitles(

                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget:  (value,m) {
                      switch (value.toInt()) {
                      case 0:
                      return PrimaryText('Oct',color: ColorManager.secondaryText,fontSize: 16.sp,);
                      case 1:
                      return  PrimaryText('Nov',color: ColorManager.secondaryText,fontSize: 16.sp,);
                      case 2:
                      return PrimaryText('Dec',color: ColorManager.secondaryText,fontSize: 16.sp,);
                      case 3:
                      return PrimaryText('Jan',color: ColorManager.secondaryText,fontSize: 16.sp,);
                      case 4:
                      return PrimaryText('Feb',color: ColorManager.secondaryText,fontSize: 16.sp,);
                      case 5:
                      return PrimaryText('Mar',color: ColorManager.secondaryText,fontSize: 16.sp,);
                      }
                      return PrimaryText('',color: ColorManager.secondaryText,fontSize: 16.sp,);
                      },
interval: 1                    ),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 1),
                          FlSpot(1, 3),
                          FlSpot(2, 1.5),
                          FlSpot(3, 2.5),
                          FlSpot(4, 4),
                          FlSpot(5, 3.5),
                        ],
                        isCurved: true,

                        dotData: const FlDotData(show: true,),
                        belowBarData: BarAreaData(show: false),
                        gradient: const LinearGradient(colors: [Colors.blueGrey,ColorManager.primary]),
                        color: ColorManager.primary,
                        barWidth: 5,
                      ),
                    ],
                  ),
                ),
              ),
              30.height,
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
