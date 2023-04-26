import 'package:viper_flutter_example/modules/home/domain/entities/movie.dart';

abstract class HomeRepository {
  Future<List<Movie>> getMovies();
}
