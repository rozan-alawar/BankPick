import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/controller/service_provider.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:dakakeen/core/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/common_widget/primary_appbar.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);
    return Scaffold(
      appBar: PrimaryAppBar(
        title: LocaleKeys.language.tr(),
        withLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: serviceProvider.filterLanguages,
              decoration: InputDecoration(
                hintText: LocaleKeys.search_language.tr(),
                prefixIcon: const Icon(Icons.search),
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
                separatorBuilder: (context, index) => 16.height,
                itemCount: serviceProvider.filteredLanguages.length,
                itemBuilder: (context, index) {
                  final language = serviceProvider.languages[index];
                  return ListTile(
                    leading: Image.asset(
                      language['flag']!,
                      width: 40.w,
                    ),
                    title: PrimaryText(
                      language['name']!,
                      fontSize: 14.sp,
                    ),
                    trailing:
                        serviceProvider.selectedLanguage == language['name']
                            ? const Icon(Icons.check_circle, color: Colors.blue)
                            : null,
                    onTap: () async {
                      await context.setLocale(
                        serviceProvider.selectedLanguage == "English"
                            ? const Locale('en')
                            : const Locale('ar'),
                      ); //BuildContext extension method

                      setState(() {
                        serviceProvider.selectedLanguage = language['name']!;
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
