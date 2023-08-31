// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
              children: widget.list
                  .map((element) => PokemonItemWidget(
                      pokemon: element, index: widget.list.indexOf(element)))
                  .toList()),
        ));
  }
}
