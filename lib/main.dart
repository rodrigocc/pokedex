import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_consome_api/app_module.dart';
import 'package:pokemon_consome_api/app_widget.dart';
import 'package:pokemon_consome_api/data/adapters/pokemon_adapter.dart';
import 'package:pokemon_consome_api/data/models/pokemon.dart';

void main() async {
  var path = Directory.current.path;
  await Hive.initFlutter();

  Hive.registerAdapter(PokemonAdapter());
  await Hive.openBox<List<Pokemon>>('favorites');
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
