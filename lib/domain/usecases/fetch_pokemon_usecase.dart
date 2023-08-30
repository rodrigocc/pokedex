import 'package:pokemon_consome_api/data/models/pokemon.dart';

abstract class FetchPokemon {
  Future<List<Pokemon>> fetchPokemons();
}
