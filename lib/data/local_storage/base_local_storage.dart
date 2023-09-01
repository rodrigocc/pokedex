import 'package:hive/hive.dart';
import 'package:pokemon_consome_api/data/models/pokemon.dart';

abstract class BaseLocalStorageRepository {
  List<Pokemon> getFavoriteList(Box box);
}
