import 'package:dartz/dartz.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/domain/entities/movie_entity.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/domain/repositories/movies_repository.dart';
import 'get_movies_usecase.dart';

class GetMoviesUseCaseImp implements GetMoviesUseCase {
  final GetMoviesRepository _getMoviesRepository;
  GetMoviesUseCaseImp(this._getMoviesRepository);

  @override
  Future<Either<Exception, MovieEntity>> call() async {
    return await _getMoviesRepository();
  }
}
