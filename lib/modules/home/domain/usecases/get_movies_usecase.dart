import 'package:viper_flutter_example/modules/home/domain/entities/movie.dart';
import 'package:viper_flutter_example/modules/home/domain/entities/no_params.dart';
import 'package:viper_flutter_example/modules/home/domain/repository/home_repository.dart';
import 'package:viper_flutter_example/modules/home/domain/usecases/usecase.dart';

class GetMoviesUseCase extends UseCase<void, NoParams> {
  final HomeRepository homeRepository;
  GetMoviesUseCase(this.homeRepository);

  @override
  Future<List<Movie>> call(NoParams params) async {
    return await homeRepository.getMovies();
  }
}
