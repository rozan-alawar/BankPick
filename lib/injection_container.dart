import 'package:dakakeen/controller/auth_provider.dart';
import 'package:dakakeen/controller/home_provider.dart';
import 'package:dakakeen/controller/intro_provider.dart';
import 'package:dakakeen/controller/profile_provider.dart';
import 'package:dakakeen/controller/service_provider.dart';
import 'package:dakakeen/controller/wallet_provider.dart';
import 'package:dakakeen/core/utils/app_config.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'core/utils/cache_helper.dart';
import 'core/utils/navigation.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {


  // Dependencies

  // Services
  sl.registerSingleton<NavigationService>(
    NavigationService(),
  );

  sl.registerSingleton<CacheHelper>(CacheHelper());

  sl.registerSingleton<AppConfig>(AppConfig());

//----------------------------- PROVIDERS ---------------------------------------------------
  sl.registerSingleton<IntroProvider>(IntroProvider());
  sl.registerSingleton<ServiceProvider>(ServiceProvider());
  sl.registerSingleton<AuthProvider>(AuthProvider());
  sl.registerSingleton<HomeProvider>(HomeProvider());
  sl.registerSingleton<WalletProvider>(WalletProvider());
  sl.registerSingleton<ProfileProvider>(ProfileProvider());

}
