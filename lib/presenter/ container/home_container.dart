import 'package:flutter/material.dart';
import 'package:pokemon_consome_api/common/error/failure.dart';
import 'package:pokemon_consome_api/data/models/pokemon.dart';
import 'package:pokemon_consome_api/domain/usecases/fetch_pokemon_usecase.dart';
import 'package:pokemon_consome_api/presenter/pages/home_error.dart';
import 'package:pokemon_consome_api/presenter/pages/home_loading.dart';

import '../pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.pokemonUseCase,
    // required this.onItemTap,
  }) : super(key: key);
  final FetchPokemonUseCase pokemonUseCase;
  // final Function(String) onItemTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<(List<Pokemon>?, Failure?)>(
      future: pokemonUseCase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            list: snapshot.data?.$1 ?? [],
          );
        }

        if (snapshot.hasError || snapshot.data?.$2 != null) {
          return HomeError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
