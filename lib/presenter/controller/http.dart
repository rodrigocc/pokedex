import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_consome_api/domain/entity/pokemon.dart';

class HttpRequests {
  Future<List<Pokemon>> fetchPokemonData() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      final result = ListPokemon.fromJson(json);

      return result.pokemon!;
    } else {
      throw Exception('Failed to load pokemon data');
    }
  }
}
