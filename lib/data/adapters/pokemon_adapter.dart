// import 'package:hive/hive.dart';
// import 'package:pokemon_consome_api/data/models/pokemon.dart';

// class PokemonAdapter extends TypeAdapter<Pokemon> {
//   @override
//   Pokemon read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.readByte()
//     };

//     return Pokemon(
//         name: fields[0] as String,
//         type: fields[1] as List<String>,
//         id: fields[2] as int,
//         num: fields[3] as String);
//   }

//   @override
//   // TODO: implement typeId
//   int get typeId => 0;

//   @override
//   void write(BinaryWriter writer, Pokemon obj) {
//     writer.writeByte(1);
//     writer.write(obj.id);
//   }
// }
