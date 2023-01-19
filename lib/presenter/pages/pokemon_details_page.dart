import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class PokemonDetailsPage extends StatefulWidget {
  final String imgUrl;
  final String number;
  final String name;
  final List<dynamic> type;

  PokemonDetailsPage(
      {Key? key,
      required this.imgUrl,
      required this.number,
      required this.name,
      required this.type})
      : super(key: key);

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
      backgroundColor: getPokemonColorBg(widget.type),
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
                  widget.name,
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
                tag: '${widget.number}',
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.contain,
                  width: 200,
                )),
          ),
        ],
      ),
    );
  }

  Color getPokemonColorBg(List<dynamic> type) {
    Color currentColor = Colors.transparent;
    int index;
    for (index = 0; index < type.length; index++) {
      if (type[index] == 'Fire') {
        return Colors.red;
      } else if (type[index] == "Grass") {
        currentColor = Colors.green;
      } else if (type[index] == "Poison") {
        currentColor = Colors.deepPurple;
      } else if (type[index] == "Ice") {
        currentColor = Colors.blueGrey;
      } else if (type[index] == "Flying") {
        currentColor = Colors.lightBlue;
      } else if (type[index] == "Water") {
        currentColor = Colors.blue;
      } else if (type[index] == "Ground") {
        currentColor = Colors.orangeAccent;
      } else if (type[index] == "Rock") {
        currentColor = Colors.brown;
      } else if (type[index] == "Electric") {
        currentColor = Colors.yellowAccent;
      } else if (type[index] == "Normal") {
        currentColor = Colors.grey;
      } else if (type[index] == "Fighting") {
        currentColor = Colors.orange;
      } else if (type[index] == "Bug") {
        currentColor = Colors.greenAccent;
      } else if (type[index][0] == "Psychic") {
        currentColor = Colors.purpleAccent;
      } else if (type[index][0] == "Fairy") {
        currentColor = Colors.yellow;
      } else if (type[index][0] == "Dragon") {
        currentColor = Colors.blueAccent;
      }
    }
    return currentColor;
  }
}
