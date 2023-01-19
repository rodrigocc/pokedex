
// class FetchPokemonUseCase implements FetchPokemon {
//   final IHttpService client;

//   const FetchPokemonUseCase({required this.client});

//   @override
//   Future<List<Pokemon>> fetchPokemons(String url) async {
//     final response = await client.get(url);
//     final body = (response) as List;
//     final pokemons = body.map(Pokemon.fromJson).toList();
//     return pokemons;
//   }
// }
