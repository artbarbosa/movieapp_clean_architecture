import 'package:get_it/get_it.dart';
import 'package:movieapp_clean_architecture_micro_frontends/core/data/services/dio_http_service_imp.dart';
import 'package:movieapp_clean_architecture_micro_frontends/core/domain/services/http_service.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/data/datasources/get_movies_datasource.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/data/datasources/local/get_movies_local_datasource_imp.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/data/datasources/remote/get_movies_remote_datasouce_imp.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/data/repositories/get_movies_repository_imp.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/domain/repositories/movies_repository.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/domain/usecases/get_movies_usecase.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/domain/usecases/get_movies_usecase_imp.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/presentation/controllers/movie_controller.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.instance;
    // core
    getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());

    // datasources
    getIt.registerLazySingleton<GetMoviesDataSource>(
      () => GetMoviesLocalDataSourceDecoratorImp(
        GetMoviesRemoteDatasourceImp(getIt()),
      ),
    );
    // repositories
    getIt.registerLazySingleton<GetMoviesRepository>(
      () => GetMoviesRepositoryImp(getIt()),
    );
    // usecases
    getIt.registerLazySingleton<GetMoviesUseCase>(
      () => GetMoviesUseCaseImp(getIt()),
    );
    // controllers
    getIt.registerLazySingleton<MovieController>(
      () => MovieController(getIt()),
    );
  }
}