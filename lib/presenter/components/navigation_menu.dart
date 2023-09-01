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
  int _currentBottomNavItemIndex = 0;
  late PageController _pageController;

  void _onPageChanged(int index) {
    setState(() {
      _currentBottomNavItemIndex = index;
      _pageController.animateToPage(_currentBottomNavItemIndex,
          curve: Curves.linear, duration: const Duration(milliseconds: 500));
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          HomeContainer(pokemonUseCase: Modular.get()),
          FavoritesPage(),
          PerfilPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentBottomNavItemIndex,
        onTap: _onPageChanged,
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
      ),
    );
  }
}
