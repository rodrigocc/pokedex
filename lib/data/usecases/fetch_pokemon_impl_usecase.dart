import 'package:pokemon_consome_api/common/error/failure.dart';
import 'package:pokemon_consome_api/data/models/pokemon.dart';
import 'package:pokemon_consome_api/domain/usecases/fetch_pokemon_usecase.dart';

import '../repositories/pokemon_repository.dart';

class FetchPokemonUseCaseImpl implements FetchPokemonUseCase {
  final PokemonRepository pokemonRepository;

  FetchPokemonUseCaseImpl({required this.pokemonRepository});
  @override
  Future<(List<Pokemon>?, Failure?)> call() =>
      pokemonRepository.getAllPokemons();
}
