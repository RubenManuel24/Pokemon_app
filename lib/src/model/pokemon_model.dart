class PokemonModel {
  PokemonModel({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.hp,
    required this.attack,
    required this.defese,
    required this.specialDefese,
    required this.speed,
    required this.type,
    required this.image,
  });

  final int id;
  final String name;
  final int height;
  final int weight;
  final int hp;
  final int attack;
  final int defese;
  final int specialDefese;
  final int speed;
  final String type;
  final String image;


  factory PokemonModel.fromMap(Map<String, dynamic> map){
    return PokemonModel(
      id: map['id'],
      name: map['name'],
      height: map['height'],
      weight: map['weight'],
      hp: map['stats'][0]['base_stat'],
      attack: map['stats'][1]['base_stat'],
      defese: map['stats'][2]['base_stat'],
      specialDefese: map['stats'][3]['base_stat'],
      speed: map['stats'][4]['base_stat'],
      type: map['types'][0]['type']['name'],
      image: map['sprites']['front_default']);
  }

}
