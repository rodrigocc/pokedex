import 'dart:io';

import 'package:pokemon_consome_api/common/error/failure.dart';
import 'package:pokemon_consome_api/data/models/pokemon.dart';
import 'package:pokemon_consome_api/gateway/http_adapter/http_adapter.dart';

abstract class PokemonDatasource {
  Future<(List<Pokemon>?, Failure?)> getAllPokemons();
}

class PokemonDatasourceImpl implements PokemonDatasource {
  final HttpAdapter httpAdapter;

  PokemonDatasourceImpl({required this.httpAdapter});
  @override
  Future<(List<Pokemon>?, Failure?)> getAllPokemons() async {
    final response = await httpAdapter.apitRequest(apitMethod: HttpMethod.get);

    if (response.statusCode == HttpStatus.ok) {
      final pokemonList = Pokemon.fromList(response.data);

      return (pokemonList, Failure(faituleType: FailureType.none));
    } else {
      return (null, Failure(faituleType: FailureType.base));
    }
  }
}
