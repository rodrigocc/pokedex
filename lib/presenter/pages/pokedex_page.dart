import 'package:flutter/material.dart';
import 'package:pokemon_consome_api/presenter/components/pokedex_app_bar.dart';
import 'package:pokemon_consome_api/presenter/components/pokemon_list_tile.dart';
import 'package:pokemon_consome_api/presenter/controller/http.dart';

class PokeDexPage extends StatefulWidget {
  PokeDexPage({Key? key}) : super(key: key);

  @override
  _PokeDexPageState createState() => _PokeDexPageState();
}

class _PokeDexPageState extends State<PokeDexPage> {
  final HttpRequests controllerHttp = HttpRequests();
  List? pokemon;

  @override
  void initState() {
    super.initState();

    controllerHttp.fetchPokemonData().then((pokedex) {
      pokemon = pokedex;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PokeDexAppBar(),
      body: ListView.builder(
        itemCount: pokemon?.length ?? 0,
        itemBuilder: (context, index) => PokemonListTile(
            type: pokemon![index]['type'],
            imgUrl: pokemon![index]['img'],
            name: pokemon![index]['name'],
            number: pokemon![index]['num']),
      ),
    );
  }
}
