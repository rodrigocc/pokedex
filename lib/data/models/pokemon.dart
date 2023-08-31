import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../theme/pokedex_colors.dart';

class Pokemon extends HiveObject {
  final String name;
  final List<String> type;
  final int id;
  final String num;
  @HiveField(1)
  bool favoritedStatus;

  static List<Pokemon> fromList(String value) {
    final map = json.decode(value);
    List<Pokemon> pokemonList = [];
    for (dynamic json in map['pokemon']) {
      pokemonList.add(Pokemon.fromMap(json));
    }

    return pokemonList;
  }

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      num: json['num'],
      type: (json['type'] as List<dynamic>)
          .map(
            (e) => e as String,
          )
          .toList(),
    );
  }

  Color? get baseColor => _color(type: type[0]);

  String get image =>
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png';
  Pokemon(
      {required this.name,
      required this.type,
      required this.id,
      required this.num,
      this.favoritedStatus = false});

  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Color(0xffFFE0CA);
        ;
      case 'Fire':
        return Color(0xffEC8C4C);
      case 'Water':
        return Color(0xff20C5F5);
      case 'Grass':
        return pokemoTypeGrassColor;
      case 'Electric':
        return Color(0xffFCF47C);

      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Color(0xffB8B8B8);

      case 'Poison':
        return Color(0xffDDA1E7);

      case 'Ground':
        return Color(0xff9E6E53);

      case 'Flying':
        return Color(0xffA98DF8);
      case 'Psychic':
        return Color(0xffA98DF8);

      case 'Bug':
        return Color(0xffD0EC94);

      case 'Rock':
        return Color(0xff9A8371);

      case 'Ghost':
        return Color(0xffCDCDCD);

      case 'Dark':
        return Color(0xff8D8ECB);

      case 'Dragon':
        return Color(0xffB7DBFF);
      case 'Steel':
        return Color(0xff7A95AA);

      case 'Fairy':
        return Color(0xffFDB7DA);

      default:
        return Colors.grey;
    }
  }
}
