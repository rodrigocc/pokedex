import 'package:pokemon_consome_api/common/error/failure.dart';
import 'package:pokemon_consome_api/data/models/pokemon.dart';

abstract class FetchPokemonUseCase {
  Future<(List<Pokemon>?, Failure?)> call();
}
