import 'package:dartz/dartz.dart';
import 'package:viper_flutter_example/modules/home/domain/entities/movie.dart';
import 'package:viper_flutter_example/modules/home/domain/entities/no_params.dart';
import 'package:viper_flutter_example/modules/home/domain/repository/home_repository.dart';
import 'package:viper_flutter_example/modules/home/domain/usecases/usecase.dart';
import 'package:viper_flutter_example/utility/app_exceptions.dart';

class GetMoviesUseCase extends UseCase<void, NoParams> {
  final HomeRepository homeRepository;
  GetMoviesUseCase(this.homeRepository);

  @override
  Future<Either<AppException, List<Movie>>> call(NoParams params) async {
    try {
      final results = await homeRepository.getMovies();
      return Right(results);
    } on FetchDataException {
      return Left(FetchDataException());
    } on UnauthorisedException {
      return Left(UnauthorisedException());
    } on BadRequestException {
      return Left(BadRequestException());
    }
  }
}
