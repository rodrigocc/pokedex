// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_consome_api/common/consts/favorite_list.dart';
import 'package:pokemon_consome_api/data/models/pokemon.dart';

import '../components/pokemon_item_widget.dart';

class HomePage extends StatefulWidget {
  final List<Pokemon> list;

  HomePage({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box<Pokemon> _favoritesBox = Hive.box<Pokemon>('favorites');

  void _favoritePokemon() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: _favoritesBox.listenable(),
      builder: (_, Box<Pokemon> box, child) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              itemBuilder: (_, index) {
                final pokemon = widget.list[index];
                return PokemonItemWidget(
                  pokemon: pokemon,
                  index: widget.list.indexOf(pokemon),
                  onTap: () async {
                    _favoritesBox.containsKey(pokemon.id)
                        ? _favoritesBox.delete(pokemon.id)
                        : _favoritesBox.put(pokemon.id, pokemon);

                    setState(() {
                      print(_favoritesBox);
                    });
                  },
                );
              },
              itemCount: widget.list.length,
            ));
      },
    ));
  }

  void savePokemon(Pokemon pokemon) {
    _favoritesBox.put(pokemon.id, pokemon);

    favoriteList.add(pokemon);

    print(favoriteList);
  }

  void deletePokemon(Pokemon pokemon) {
    _favoritesBox.delete(pokemon.id);
    favoriteList.remove(pokemon);

    print(favoriteList);
  }
}
