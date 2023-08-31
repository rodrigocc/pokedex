// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
  Box<List<Pokemon>> _favoritesBox = Hive.box<List<Pokemon>>('favorites');
  int _currentBottomNavItemIndex = 0;
  void _setBottomNavIndex(int index) {
    setState(() {
      _currentBottomNavItemIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/home_icon.png',
                height: 50,
                width: 50,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/pokeball_icon.png',
                height: 50,
                width: 50,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/perfil_icon.png',
                height: 50,
                width: 50,
              ),
              label: 'Perfil',
            ),
          ],
          currentIndex: _currentBottomNavItemIndex,
          onTap: _setBottomNavIndex,
        ),
        body: ValueListenableBuilder(
          valueListenable: _favoritesBox.listenable(),
          builder: (_, Box<List<Pokemon>> box, child) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  itemBuilder: (_, index) => PokemonItemWidget(
                    pokemon: widget.list[index],
                    index: widget.list.indexOf(widget.list[index]),
                    onTap: () async {
                      widget.list[index].favoritedStatus
                          ? await box.delete(index)
                          : await _favoritesBox.add(widget.list);

                      setState(() {
                        print(_favoritesBox);
                      });
                    },
                  ),
                  itemCount: widget.list.length,
                ));
          },
        ));

    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 8),
    //   child: ListView(
    //       children: widget.list
    //           .map((element) => PokemonItemWidget(
    //               pokemon: element, index: widget.list.indexOf(element)))
    //           .toList()),
    // ));
  }
}
