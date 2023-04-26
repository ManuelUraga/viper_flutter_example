import 'package:viper_flutter_example/modules/home/data/data_source/home_data_source.dart';
import 'package:viper_flutter_example/modules/home/domain/entities/movie.dart';
import 'package:viper_flutter_example/modules/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl(this.homeDataSource);

  @override
  Future<List<Movie>> getMovies() async {
    final response = await homeDataSource.getMovies();
    return response;
  }
}
