import 'package:flutter/material.dart';

import 'package:pokemon_consome_api/presenter/components/pokedex_app_bar.dart';
import 'package:pokemon_consome_api/presenter/components/pokemon_list_tile.dart';
import 'package:pokemon_consome_api/presenter/controller/http.dart';

import '../../domain/entity/pokemon.dart';

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
      body: FutureBuilder<List<Pokemon>>(
          future: controllerHttp.fetchPokemonData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) => PokemonListTile(
                  type: snapshot.data![index].type!,
                  imgUrl: snapshot.data![index].img!,
                  name: snapshot.data![index].name!,
                  number: snapshot.data![index].num!),
            );
          }),
    );
  }

  void _onChangedSearchList(String query) {
    List listResult = [];
    List foundResult = [];

    if (query.isEmpty) {
      listResult = pokemon!;
    } else {
      listResult = pokemon!
          .where((element) =>
              element["name"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      foundResult = listResult;
    });
  }
}
