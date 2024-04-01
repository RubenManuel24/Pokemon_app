import 'package:pokemon_app/src/model/pokemon_model.dart';
import '../fb/either.dart';

abstract interface class PokemonRepository{
  Future<List<PokemonModel>> getAllPokemon();
}