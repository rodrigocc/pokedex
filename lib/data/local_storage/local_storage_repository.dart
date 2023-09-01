import 'package:hive/hive.dart';
import 'package:pokemon_consome_api/data/local_storage/base_loca_storage.dart';
import 'package:pokemon_consome_api/data/models/pokemon.dart';

class LocalStorageRepository extends BaseLocalStorageRepository {
  @override
  List<Pokemon> getFavoriteList(Box box) {
    return box.values.toList() as List<Pokemon>;
  }
}
