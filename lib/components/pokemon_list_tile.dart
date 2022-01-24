import 'package:flutter/material.dart';
import 'package:pokemon_consome_api/pages/pokemon_details_page.dart';
import 'package:pokemon_consome_api/theme/pokedex_colors.dart';
import 'package:pokemon_consome_api/theme/pokemon_icons.dart';

class PokemonListTile extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String number;
  final List<dynamic> type;

  const PokemonListTile(
      {Key? key,
      required this.imgUrl,
      required this.name,
      required this.number,
      required this.type})
      : super(key: key);

  @override
  _PokemonListTileState createState() => _PokemonListTileState();
}

class _PokemonListTileState extends State<PokemonListTile> {
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
                    tag: '${widget.number}',
                    child: Image.network(
                      widget.imgUrl,
                      height: 100,
                      width: 100,
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
                        widget.name,
                        style: TextStyle(
                            color: pokemonNameColor,
                            fontFamily: 'OpenSans',
                            fontSize: 19,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '#${widget.number}',
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
                    children: getPokemonType(widget.type),
                  ),
                ],
              ),
              Divider(
                color: Colors.black45,
              )
            ],
          )),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PokemonDetailsPage(
                      type: widget.type,
                      imgUrl: widget.imgUrl,
                      number: widget.number,
                      name: widget.name,
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
