import 'package:pokemon_consome_api/domain/entity/pokemon.dart';

abstract class FetchPokemon {
  Future<List<Pokemon>> fetchPokemons();
}
