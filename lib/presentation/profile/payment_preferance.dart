import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentPreferancesSection extends StatelessWidget {
  const PaymentPreferancesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
            LocaleKeys.category_chart.tr(),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          16.height,
          Center(
            child: SizedBox(
              height: 320,
              child: PieChart(
                PieChartData(

                  sections: _getSections(),
                  centerSpaceRadius: 100,

                  sectionsSpace: 6,
                ),
              ),
            ),
          ),
          16.height,
          _buildLegend(),
        ],
      ),
    );
  }

  List<PieChartSectionData> _getSections() {
    return [
      PieChartSectionData(
        color: Colors.orange[300],
        value: 25,
        title: '',
        radius: 50,

      ),
      PieChartSectionData(
        color: Colors.green[300],
        value: 20,
        title: '',
        radius: 50,
      ),
      PieChartSectionData(
        color: Colors.blue[300],
        value: 15,
        title: '',
        radius: 50,

      ),
      PieChartSectionData(
        color: Colors.red[300],
        value: 10,
        title: '',
        radius: 50,

      ),
      PieChartSectionData(
        color: Colors.purple[300],
        value: 20,
        title: '',
        radius: 50,

      ),
      PieChartSectionData(
        color: Colors.yellow[300],
        value: 10,
        title: '',
        radius: 50,

      ),
    ];
  }

  Widget _buildLegend() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: [
        _buildLegendItem(Colors.orange[300]!, LocaleKeys.transaction.tr()),
        _buildLegendItem(Colors.green[300]!,  LocaleKeys.transfer.tr()),
        _buildLegendItem(Colors.blue[300]!,  LocaleKeys.travel.tr()),
        _buildLegendItem(Colors.red[300]!,  LocaleKeys.food.tr()),
        _buildLegendItem(Colors.purple[300]!,  LocaleKeys.shopping.tr()),
        _buildLegendItem(Colors.yellow[300]!,  LocaleKeys.car.tr()),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 15.w,
          height: 15.h,
          color: color,
        ),
       8.width,
        PrimaryText(text),
      ],
    );
  }
}
