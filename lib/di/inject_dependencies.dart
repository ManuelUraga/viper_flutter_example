import 'package:get_it/get_it.dart';
import 'package:viper_flutter_example/modules/home/bloc/home_bloc.dart';
import 'package:viper_flutter_example/modules/home/data/data_source/home_data_source.dart';
import 'package:viper_flutter_example/modules/home/data/repository/home_repository_impl.dart';
import 'package:viper_flutter_example/modules/home/data/rest_service.dart';
import 'package:viper_flutter_example/modules/home/domain/repository/home_repository.dart';
import 'package:viper_flutter_example/modules/home/domain/usecases/get_movies_usecase.dart';

final _getIt = GetIt.instance;

Future init() async {
  //RestServices
  _getIt.registerLazySingleton(() => RestService());

  // DataSource
  _getIt.registerLazySingleton<HomeDataSource>(
      () => HomeDataSourceImpl(_getIt()));

  // Repository
  _getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(_getIt()));

  // UseCase
  _getIt.registerLazySingleton<GetMoviesUseCase>(
      () => GetMoviesUseCase(_getIt()));

  //Bloc
  _getIt.registerFactory(() => HomeBloc(_getIt()));
}

class UseCases {
  UseCases._();
  static GetMoviesUseCase get getMoviesUseCase => _getIt.get();
}
