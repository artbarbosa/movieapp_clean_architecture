
import 'package:dartz/dartz.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/data/datasources/get_movies_datasource.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/domain/entities/movie_entity.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/domain/repositories/movies_repository.dart';

class GetMoviesRepositoryImp implements GetMoviesRepository {
  final GetMoviesDataSource _getMoviesDataSource;
  GetMoviesRepositoryImp(this._getMoviesDataSource);

  @override
  Future<Either<Exception, MovieEntity>> call() async {
    return await _getMoviesDataSource();
  }
}