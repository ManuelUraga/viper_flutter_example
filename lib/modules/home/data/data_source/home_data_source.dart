import 'package:viper_flutter_example/modules/home/data/rest_service.dart';
import 'package:viper_flutter_example/modules/home/domain/entities/movie.dart';
import 'package:viper_flutter_example/modules/home/domain/entities/now_playing_response.dart';

abstract class HomeDataSource {
  Future<List<Movie>> getMovies();
}

class HomeDataSourceImpl extends HomeDataSource {
  RestService restService;
  HomeDataSourceImpl(this.restService);

  @override
  Future<List<Movie>> getMovies() async {
    final uri = await restService.getJsonData('3/movie/now_playing');
    final response = await restService.get(uri);
    return NowPlayingResponse.fromJson(response).results;
  }
}
