import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_consome_api/data/repositories/pokemon_repository.dart';
import 'package:pokemon_consome_api/presenter/%20container/home_container.dart';

import 'package:pokemon_consome_api/theme/pokedex_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(
        seconds: 5,
      ),
    ).then((value) => Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (_) =>
                HomeContainer(repository: PokemonRepository(dio: Dio())))));
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
