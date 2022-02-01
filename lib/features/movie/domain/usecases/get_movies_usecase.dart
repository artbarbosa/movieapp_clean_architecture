import 'package:dartz/dartz.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/domain/entities/movie_entity.dart';

abstract class GetMoviesUseCase {
  Future<Either<Exception, MovieEntity>> call();
}
