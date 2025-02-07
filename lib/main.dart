import 'package:dakakeen/config/routes/router.dart';
import 'package:dakakeen/controller/auth_provider.dart';
import 'package:dakakeen/controller/home_provider.dart';
import 'package:dakakeen/controller/intro_provider.dart';
import 'package:dakakeen/controller/profile_provider.dart';
import 'package:dakakeen/controller/service_provider.dart';
import 'package:dakakeen/controller/wallet_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'config/routes/routes.dart';
import 'config/theme/theme_manager.dart';
import 'core/utils/cache_helper.dart';
import 'core/utils/navigation.dart';
import 'injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Ensure that ScreenUtil's screen size is initialized
  await ScreenUtil.ensureScreenSize();

  // Ensure that localization is initialized
  await EasyLocalization.ensureInitialized();

  // Initialize dependency injection
  await initializeDependencies();

  // Initialize cache
  await CacheHelper.init();

  // Set preferred device orientations and system UI overlay style.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(
    EasyLocalization(
      path: 'assets/lang',
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      fallbackLocale: const Locale('ar'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: sl<IntroProvider>(),
          ),
          ChangeNotifierProvider.value(
            value: sl<ServiceProvider>(),
          ),
          ChangeNotifierProvider.value(
            value: sl<AuthProvider>(),
          ),
          ChangeNotifierProvider.value(
            value: sl<HomeProvider>(),
          ),
          ChangeNotifierProvider.value(
            value: sl<WalletProvider>(),
          ),
          ChangeNotifierProvider.value(
            value: sl<ProfileProvider>(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Provider.of<ServiceProvider>(context).getTheme(),
            darkTheme: ThemeDataStyle.dark,
            navigatorKey: sl<NavigationService>().navigatorKey,
            scaffoldMessengerKey: sl<NavigationService>().snackBarKey,
            initialRoute: Routes.home,
            onGenerateRoute: AppRoutes.onGenerateRoutes,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          ),
        );
      },
    );
  }
}

//rozan@gmail.com
//Roii222!@
