import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/color_manager.dart';
import 'package:dakakeen/controller/intro_provider.dart';
import 'package:dakakeen/core/common_widget/primary_button.dart';
import 'package:dakakeen/core/common_widget/primary_text.dart';
import 'package:dakakeen/core/extensions/empty_space_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../config/routes/routes.dart';
import '../../core/utils/navigation.dart';
import '../../injection_container.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController? pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

  }

  @override
  Widget build(BuildContext context) {

    final introProvider = Provider.of<IntroProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: introProvider.titles.length,
              onPageChanged: (index) {
                introProvider.setPage(index);
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  title: introProvider.titles[index],
                  subtitle: introProvider.subtitles[index],
                  image: introProvider.images[index],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(introProvider.titles.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: introProvider.currentPage == index ? 30 : 8,
                height: introProvider.currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  color: introProvider.currentPage == index
                      ? Colors.blue
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(
                      introProvider.currentPage == index ? 20 : 50),
                ),
              );
            }),
          ),
          20.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: PrimaryButton(
              color: ColorManager.primary,
              width: double.infinity,
              height: 56.h,
              onPressed: () {
                if (introProvider.currentPage ==
                    introProvider.titles.length - 1) {
                  sl<NavigationService>().navigateTo(Routes.login);
                } else {
                  pageController!.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              child:
              PrimaryText(
                introProvider.currentPage == introProvider.titles.length - 1
                    ? 'Get Started'
                    : 'Next',
                color:  ColorManager.white,
                fontWeight: FontWeight.bold,
                //     ? ColorManager.blue.withOpacity(0.7)
                //     : Colors.white,

                // height: 1,
              ),

            ),
          ),
          50.height,

        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
