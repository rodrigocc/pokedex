import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_consome_api/pages/pokedex_page.dart';
import 'package:pokemon_consome_api/theme/pokedex_colors.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(
        seconds: 5,
      ),
    ).then((value) => Navigator.push(
        context, CupertinoPageRoute(builder: (_) => PokeDexPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: pokeDexDefaultBg.withOpacity(0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 30,
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: pokeDexGradientBg)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/charizard.gif',
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
        ],
      ),
    );
  }
}
