import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'English';
  List<Map<String, String>> languages = [
    {'name': 'English', 'flag': 'assets/flags/us.png'},
    {'name': 'Australia', 'flag': 'assets/flags/au.png'},
    {'name': 'Franch', 'flag': 'assets/flags/fr.png'},
    {'name': 'Spanish', 'flag': 'assets/flags/es.png'},
    {'name': 'America', 'flag': 'assets/flags/us.png'},
    {'name': 'Vietnam', 'flag': 'assets/flags/vn.png'},
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back navigation
          },
        ),
        title: Text('Language'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: filterLanguages,
              decoration: InputDecoration(
                hintText: 'Search Language',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: filteredLanguages.length,
                itemBuilder: (context, index) {
                  final language = filteredLanguages[index];
                  return ListTile(
                    leading: Image.asset(
                      language['flag']!,
                      width: 40.w,
                    ),
                    title: Text(language['name']!),
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