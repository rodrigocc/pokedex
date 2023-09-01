// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_consome_api/data/models/pokemon.dart';

import '../components/pokemon_item_widget.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Box<Pokemon> _favoritesBox = Hive.box<Pokemon>('favorites');

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
        List<Pokemon> favorites = List.from(box.values);
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              itemBuilder: (_, index) => PokemonItemWidget(
                pokemon: favorites[index],
                index: favorites.indexOf(favorites[index]),
                onTap: () async {
                  favorites[index].favoritedStatus =
                      !favorites[index].favoritedStatus;
                  favorites[index].favoritedStatus
                      ? await box.delete(index)
                      : await _favoritesBox.add(favorites[index]);

                  setState(() {
                    print(_favoritesBox);
                  });
                },
              ),
              itemCount: favorites.length,
            ));
      },
    ));
  }
}
