class Pokemon {
  final String name;
  final String img;
  final String number;
  final List<String> type;

  const Pokemon(
      {required this.type,
      required this.name,
      required this.img,
      required this.number});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'img': img,
      'number': number,
      'type': type,
    };
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      img: json['img'],
      number: json['number'],
      type: json['type'] as List<String>,
    );
  }
}
