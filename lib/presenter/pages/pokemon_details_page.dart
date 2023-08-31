import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:pokemon_consome_api/data/models/pokemon.dart';
import 'package:pokemon_consome_api/theme/pokedex_colors.dart';

class PokemonDetailsPage extends StatefulWidget {
  final Pokemon pokemon;
  final List<dynamic> type;

  PokemonDetailsPage({
    Key? key,
    required this.pokemon,
    required this.type,
  }) : super(key: key);

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 8.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: widget.pokemon.baseColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 80),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  widget.pokemon.name,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 100,
            child: Hero(
                tag: '${widget.pokemon.num}',
                child: Image.network(
                  widget.pokemon.image,
                  fit: BoxFit.contain,
                  width: 200,
                )),
          ),
        ],
      ),
    );
  }
}
