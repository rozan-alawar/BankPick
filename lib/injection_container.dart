import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'config/api/api_paths.dart';
import 'core/utils/navigation.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  Dio client = Dio(
    BaseOptions(
      baseUrl: Links.baseLink,
      receiveDataWhenStatusError: true,
    ),
  );

  sl.registerLazySingleton<Dio>(() => client);

  // Dependencies

  // Services
  sl.registerSingleton<NavigationService>(
    NavigationService(),
  );

  // sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  // sl.registerSingleton<ArticleRepository>(
  //   ArticleRepositoryImpl(sl(),sl())
  // );

  //UseCases
  // sl.registerSingleton<GetArticleUseCase>(
  //   GetArticleUseCase(sl())
  // );

  // sl.registerSingleton<GetSavedArticleUseCase>(
  //   GetSavedArticleUseCase(sl())
  // );

  // sl.registerSingleton<SaveArticleUseCase>(
  //   SaveArticleUseCase(sl())
  // );

  // sl.registerSingleton<RemoveArticleUseCase>(
  //   RemoveArticleUseCase(sl())
  // );

  //Blocs
  // sl.registerFactory<RemoteArticlesBloc>(
  //   ()=> RemoteArticlesBloc(sl())
  // );

  // sl.registerFactory<LocalArticleBloc>(
  //   ()=> LocalArticleBloc(sl(),sl(),sl())
  // );
}
