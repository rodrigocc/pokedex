import 'package:pokemon_consome_api/entity/pokemon.dart';

abstract class FetchPokemon {
  Future<List<Pokemon>> fetchPokemons();
}
