import 'package:dio/dio.dart';
import 'package:movieapp_clean_architecture_micro_frontends/core/domain/services/http_service.dart';

class DioHttpServiceImp implements HttpService {
  late Dio _dio;
  DioHttpServiceImp() {
    _dio = Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/4/', headers: {
      'content-type': 'application/json;charset=utf-8',
      'authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YTQyNTExNTBlOTg5OGQ4NWI0Y2UzMThjODczMTQ5OSIsInN1YiI6IjYxOTc5ZmYxOTUxMmUxMDA4OGQ5ZjU1YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6bbJ0UZlqnjG-XjKpAASX4mUaBowoc2Bz2FLI9eJhK0',
    }));
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
    );
  }
}
