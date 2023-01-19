import '../entity/pokemon.dart';

abstract class FetchPokemon {
  Future<List<Pokemon>> fetchPokemons();
}
