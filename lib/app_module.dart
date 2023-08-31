import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_consome_api/presenter/%20container/home_container.dart';
import 'package:pokemon_consome_api/presenter/pages/splash_page.dart';

import 'data/repositories/pokemon_repository.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => SplashPage(title: ''));
    r.child('/home',
        child: (context) =>
            HomeContainer(repository: PokemonRepository(dio: Dio())));
    // r.child('/favorites', child: FavoritesPage());

    // r.child('details',
    //     child: PokemonDetailsPage(
    //       pokemon: null,
    //       type: [],
    //     ));
  }
}
