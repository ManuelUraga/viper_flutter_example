part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class MoviesObtained extends HomeState {
  final List<Movie> movie;
  MoviesObtained(this.movie);
}

class FailureObtainedState extends HomeState {}
