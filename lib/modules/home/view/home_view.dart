import 'package:flutter/material.dart';
import 'package:viper_flutter_example/di/inject_dependencies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viper_flutter_example/modules/home/view/widgets/card_swipper.dart';

import '../bloc/home_bloc.dart' as bloc;
import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        UseCases.getMoviesUseCase,
      )..add(
          bloc.GetMovies(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas mas vistas'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MoviesObtained) {
              return CardSwiper(movies: state.movie);
            } else if(state is FailureObtainedState){
              return Center(
                child: Column(children: [Text(state.failureMessage)]),
              );
            }else {
              return Center(
                child:
                    Column(children: const [Text('Error al cargar las peliculas')]),
              );
            }
          },
        ),
      ),
    );
  }
}
