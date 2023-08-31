import 'package:hive/hive.dart';
import 'package:pokemon_consome_api/data/models/pokemon.dart';

class PokemonAdapter extends TypeAdapter<Pokemon> {
  @override
  Pokemon read(BinaryReader reader) {
    final pokemonFavorites = reader.read();

    return pokemonFavorites;
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Pokemon obj) {
    writer.write(obj);
  }
}
