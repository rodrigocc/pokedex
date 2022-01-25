import 'package:flutter/material.dart';
import 'package:pokemon_consome_api/theme/pokedex_colors.dart';

class PokeDexAppBar extends StatefulWidget implements PreferredSizeWidget {
  PokeDexAppBar({Key? key}) : super(key: key);

  @override
  _PokeDexAppBarState createState() => _PokeDexAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(140);
}

class _PokeDexAppBarState extends State<PokeDexAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: pokeDexDefaultBg.withOpacity(0.5),
        gradient: LinearGradient(colors: pokeDexGradientBg),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pokemon',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
            ),
            child: Text('Teste'),
          )
        ],
      ),
    );
  }
}
