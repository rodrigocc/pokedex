import 'package:hive/hive.dart';
import 'package:pokemon_consome_api/data/models/pokemon.dart';

class PokemonAdapter extends TypeAdapter<Pokemon> {
  @override
  Pokemon read(BinaryReader reader) {
    final fields = reader.readByte();
    final id = reader.read();

    return Pokemon(name: '', type: [], id: id, num: '');
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Pokemon obj) {
    writer.writeByte(1);
    writer.write(obj.id);
  }
}
