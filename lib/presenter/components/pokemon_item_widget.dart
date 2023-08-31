import 'package:flutter/material.dart';

import 'package:pokemon_consome_api/theme/pokemon_icons.dart';

import '../../data/models/pokemon.dart';
import '../../theme/pokedex_colors.dart';
import '../pages/pokemon_details_page.dart';

class PokemonItemWidget extends StatefulWidget {
  final Pokemon pokemon;
  final int index;
  final Function() onTap;

  const PokemonItemWidget({
    Key? key,
    required this.pokemon,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  _PokemonItemWidgetState createState() => _PokemonItemWidgetState();
}

class _PokemonItemWidgetState extends State<PokemonItemWidget> {
  List<Pokemon> favoritedList = [];

  void _favoritePokemon() {
    setState(() {
      widget.pokemon.favoritedStatus = !widget.pokemon.favoritedStatus;
    });

    favoritedList.add(widget.pokemon);

    print(favoritedList);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          margin: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              color: widget.pokemon.baseColor,
              borderRadius: BorderRadius.circular(32)),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Image.asset("assets/images/pokeball.png",
                  height: 110, width: 110),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '#${widget.pokemon.num}',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Text(
                            widget.pokemon.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: getPokemonType(widget.pokemon.type),
                          ),
                        ],
                      ),
                      Hero(
                        tag: '${widget.pokemon.num}',
                        child: Image.network(
                          widget.pokemon.image,
                          height: 100,
                          width: 100,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Text('Image not Loaded');
                          },
                        ),
                      ),
                      GestureDetector(
                        child: widget.pokemon.favoritedStatus
                            ? Icon(
                                Icons.favorite,
                                size: 50,
                              )
                            : Icon(Icons.favorite_border_outlined, size: 35),
                        onTap: widget.onTap,
                      )
                    ],
                  ),
                ],
              ),
            ],
          )),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PokemonDetailsPage(
                      type: widget.pokemon.type,
                      pokemon: widget.pokemon,
                    )));
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
