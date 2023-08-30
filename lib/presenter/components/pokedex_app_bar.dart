import 'package:flutter/material.dart';
import 'package:pokemon_consome_api/theme/pokedex_colors.dart';

class PokeDexAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<String>? onChanged;

  PokeDexAppBar({Key? key, required this.onChanged}) : super(key: key);

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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                labelText: 'Digite o nome do pokemon',
              ),
            ),
          )
        ],
      ),
    );
  }
}
