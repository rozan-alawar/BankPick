import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/common_widget/circular_card.dart';
import '../../core/common_widget/primary_appbar.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'English';
  List<Map<String, String>> languages = [
    {'name': 'English', 'flag': ImageAssets.en_flag},
    {'name': 'Australia', 'flag': ImageAssets.au_flag},
    {'name': 'Franch', 'flag': ImageAssets.fr_flag},
    {'name': 'Spanish', 'flag': ImageAssets.es_flag},
    {'name': 'America', 'flag': ImageAssets.us_flag},
    {'name': 'Vietnam', 'flag': ImageAssets.vn_flag},
  ];

  List<Map<String, String>> filteredLanguages = [];

  @override
  void initState() {
    super.initState();
    filteredLanguages = languages;
  }

  void filterLanguages(String query) {
    final filtered = languages.where((language) {
      final languageName = language['name']!.toLowerCase();
      final input = query.toLowerCase();
      return languageName.contains(input);
    }).toList();

    setState(() {
      filteredLanguages = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PrimaryAppBar(title: LocaleKeys.language.tr(),withLeading: true,),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
              onChanged: filterLanguages,
              decoration: InputDecoration(
                hintText:LocaleKeys.search_language.tr(),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.3),
              ),
            ),
          20.height,
            Expanded(
              child: ListView.separated(
                separatorBuilder:(context, index) =>  16.height,
                itemCount: filteredLanguages.length,
                itemBuilder: (context, index) {
                  final language = filteredLanguages[index];
                  return ListTile(
                    leading: Image.asset(
                      language['flag']!,
                      width: 40.w,
                    ),
                    title: PrimaryText(language['name']!, fontSize: 14.sp,),
                    trailing: selectedLanguage == language['name']
                        ? Icon(Icons.check_circle, color: Colors.blue)
                        : null,
                    onTap: () {
                      setState(() {
                        selectedLanguage = language['name']!;
                      });
                    },
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