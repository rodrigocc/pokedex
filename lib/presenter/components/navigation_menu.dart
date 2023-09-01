import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_consome_api/presenter/%20container/home_container.dart';
import 'package:pokemon_consome_api/presenter/pages/favorites_page.dart';
import 'package:pokemon_consome_api/presenter/pages/perfil_page.dart';

class NavigationBarMenu extends StatefulWidget {
  const NavigationBarMenu({super.key});

  @override
  State<NavigationBarMenu> createState() => _NavigationBarMenuState();
}

class _NavigationBarMenuState extends State<NavigationBarMenu> {
  int _currentPageIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          HomeContainer(pokemonUseCase: Modular.get()),
          FavoritesPage(),
          PerfilPage(),
        ],
        onPageChanged: _onPageChanged,
      ),
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
        currentIndex: _currentPageIndex,
        onTap: _onPageChanged,
      ),
    );
  }
}
