import 'package:flutter/material.dart';

import 'package:pokemon_consome_api/theme/pokedex_colors.dart';
import 'package:pokemon_consome_api/theme/pokemon_icons.dart';

import '../../data/models/pokemon.dart';

class PokemonItemWidget extends StatefulWidget {
  final Pokemon pokemon;
  final int index;

  const PokemonItemWidget({
    Key? key,
    required this.pokemon,
    required this.index,
  }) : super(key: key);

  @override
  _PokemonItemWidgetState createState() => _PokemonItemWidgetState();
}

class _PokemonItemWidgetState extends State<PokemonItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.fromLTRB(16, 0.0, 16, 16),
          child: Column(
            children: [
              Row(
                children: [
                  Hero(
                    tag: '${widget.pokemon.num}',
                    child: Image.network(
                      widget.pokemon.image,
                      height: 80,
                      width: 80,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Text('Image not Loaded');
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.pokemon.name,
                        style: TextStyle(
                            color: pokemonNameColor,
                            fontFamily: 'OpenSans',
                            fontSize: 19,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '#${widget.pokemon.num}',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Text(''),
                  ),
                  Row(
                    children: getPokemonType(widget.pokemon.type),
                  ),
                ],
              ),
            ],
          )),
      onTap: () {
        // Navigator.push(
        //     context,
        //     // MaterialPageRoute(
        //     //     builder: (_) => PokemonDetailsPage(
        //     //           type: widget.pokemon.type,

        //     //         )));
      },
    );
  }

  List<Image> getPokemonType(List<dynamic> type) {
    List<Image> iconType = [];
    int index;
    for (index = 0; index < type.length; index++) {
      if (type[index] == 'Fire') {
        iconType.add(Image.asset(PokemonIcons.fire));
      } else if (type[index] == "Grass") {
        iconType.add(Image.asset(PokemonIcons.grass));
      } else if (type[index] == "Poison") {
        iconType.add(Image.asset(PokemonIcons.poison));
      } else if (type[index] == "Ice") {
        iconType.add(Image.asset(PokemonIcons.ice));
      } else if (type[index] == "Flying") {
        iconType.add(Image.asset(PokemonIcons.flying));
      } else if (type[index] == "Water") {
        iconType.add(Image.asset(PokemonIcons.water));
      } else if (type[index] == "Ground") {
        iconType.add(Image.asset(PokemonIcons.ground));
      } else if (type[index] == "Rock") {
        iconType.add(Image.asset(PokemonIcons.rock));
      } else if (type[index] == "Electric") {
        iconType.add(Image.asset(PokemonIcons.eletric));
      } else if (type[index] == "Normal") {
        iconType.add(Image.asset(PokemonIcons.normal));
      } else if (type[index] == "Fighting") {
        iconType.add(Image.asset(PokemonIcons.fighting));
      } else if (type[index] == "Bug") {
        iconType.add(Image.asset(PokemonIcons.bug));
      } else if (type[index] == "Psychic") {
        iconType.add(Image.asset(PokemonIcons.psychic));
      } else if (type[index] == "Fairy") {
        iconType.add(Image.asset(PokemonIcons.fairy));
      } else if (type[index] == "Dragon") {
        iconType.add(Image.asset(PokemonIcons.dragon));
      }
    }
    return iconType;
  }
}
