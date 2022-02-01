import 'package:dartz/dartz.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/domain/entities/movie_entity.dart';

abstract class GetMoviesRepository {
  Future<Either<Exception, MovieEntity>> call();
}
