import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_consome_api/data/repositories/pokemon_repository.dart';
import 'package:pokemon_consome_api/presenter/pages/splash_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<Dio>((i) => Dio());
    i.addSingleton<IPokemonRepository>((i) => PokemonRepository(dio: i()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => SplashPage(title: ''));
    // r.child('/home',
    //     child: (context) =>
    //         HomeContainer(repository: PokemonRepository(dio: )));
    // r.child('/favorites', child: FavoritesPage());

    // r.child('details',
    //     child: PokemonDetailsPage(
    //       pokemon: null,
    //       type: [],
    //     ));
  }
}
