import 'package:pokemon_consome_api/common/error/failure.dart';

import 'package:pokemon_consome_api/data/datasources/pokemon_datasource.dart';
import 'package:pokemon_consome_api/data/models/pokemon.dart';

abstract class PokemonRepository {
  Future<(List<Pokemon>?, Failure?)> getAllPokemons();
}

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource pokemonDatasource;

  PokemonRepositoryImpl({required this.pokemonDatasource});

  @override
  Future<(List<Pokemon>?, Failure?)> getAllPokemons() =>
      pokemonDatasource.getAllPokemons();
}
