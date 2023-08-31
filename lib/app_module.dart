import 'package:flutter_modular/flutter_modular.dart';

import 'package:pokemon_consome_api/data/datasources/pokemon_datasource.dart';
import 'package:pokemon_consome_api/data/usecases/fetch_pokemon_impl_usecase.dart';
import 'package:pokemon_consome_api/data/repositories/pokemon_repository.dart';
import 'package:pokemon_consome_api/domain/usecases/fetch_pokemon_usecase.dart';
import 'package:pokemon_consome_api/gateway/http_adapter/http_adapter.dart';
import 'package:pokemon_consome_api/presenter/%20container/home_container.dart';
import 'package:pokemon_consome_api/presenter/pages/pokemon_details_page.dart';
import 'package:pokemon_consome_api/presenter/pages/splash_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<HttpAdapter>(HttpAdpaterImpl.new);
    i.add<PokemonRepository>(PokemonRepositoryImpl.new);
    i.add<FetchPokemonUseCase>(FetchPokemonUseCaseImpl.new);
    i.add<PokemonDatasource>(PokemonDatasourceImpl.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => SplashPage(),
    );
    r.child(
      '/home',
      child: (_) => HomeContainer(pokemonUseCase: Modular.get()),
    );
    r.child(
      '/details',
      child: (_) => PokemonDetailsPage(pokemon: r.args.data, type: []),
    );
  }
}
