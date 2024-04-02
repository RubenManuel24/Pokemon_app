import 'package:flutter/material.dart';
import 'package:pokemon_app/src/model/pokemon_model.dart';
import 'package:pokemon_app/src/repository/pokemon_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class HomeController {
  HomeController({
    required PokemonRepository pokemonRepository,
  }): _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;
  final _pokemonInfor = signal<List<PokemonModel?>>([]);
  final _loading = signal<bool>(false);

  List<PokemonModel?> get pokemonInfor => _pokemonInfor();
  bool get loadibg => _loading();

 Color colorCardPokemon(String type){
    switch(type){
      case 'fire':
      return const Color(0xFFFF4500);
      case 'water':
      return  Color(0xFF6495ED);
      case 'electric':
      return Color(0xFFFFFF00);
      case 'rock':
      return Color(0xFFA9A9A9);
      case 'normal':
      return Color(0xFFA9A9A9);
      case 'flying':
      return Colors.white;
      case 'ground': 
      return Color(0xFF8B4513);
      case 'fairy': 
      return Color(0xFFFF69B4);
      case 'dark':
      return  Color(0xFF483D8B);
      case 'grass':
      return Color(0xFF228B22);
      case 'ice':
      return Color(0xFF87CEEB);
      case 'psychic':
      return Color(0xFFBA55D3);
      case 'bug':
      return Color(0xFF008000);
      case 'poison':
      return Color(0xFF800080);
      case 'fighting':
      return Color(0xFFB22222);
      case 'ghost':
      return Color(0xFF4B0082);
      case 'dragon':
      return Color(0xFF800080);
      case 'steel':
      return Color(0xFFC0C0C0);
      default: {
         return Colors.grey;
      }



    }

  }

  Future<void> getAllPokemon() async {
    _loading.value = true;
    final result = await _pokemonRepository.getAllPokemon();

    if(result.isEmpty){
      print('Listavazia');
    }
    else{
       _loading.value = false;

      _pokemonInfor.value = result;
    }
  }
}
