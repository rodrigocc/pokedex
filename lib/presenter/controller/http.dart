import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpRequests {
  Future<List> fetchPokemonData() async {
    List pokedex;
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      pokedex = json['pokemon'];

      return pokedex;
    } else {
      throw Exception('Failed to load pokemon data');
    }
  }
}
