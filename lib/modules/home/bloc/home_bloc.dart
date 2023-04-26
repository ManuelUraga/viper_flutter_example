// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:viper_flutter_example/modules/home/domain/entities/movie.dart';
import 'package:viper_flutter_example/modules/home/domain/entities/no_params.dart';
import 'package:viper_flutter_example/modules/home/domain/usecases/get_movies_usecase.dart';

part 'home_event.dart';
part 'home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetMoviesUseCase getMoviesUseCase;

  HomeBloc(this.getMoviesUseCase) : super(HomeInitial()) {
    on<GetMovies>((event, emit) async {
      emit(HomeLoading());
      final result = await getMoviesUseCase.call(NoParams());
      emit(MoviesObtained(result));
    });
  }
}
