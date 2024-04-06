import 'package:pokemon_app/src/model/pokemon_model.dart';

abstract interface class PokemonRepository{
  Future<List<PokemonModel>> getAllPokemon();
}