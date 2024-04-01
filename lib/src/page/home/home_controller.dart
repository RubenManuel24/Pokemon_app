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
      return Colors.orange;
      case 'water':
      return Colors.blue;
      case 'electric':
      return Colors.yellow;
      case 'normal':
      return Colors.grey;
      case 'flying':
      return Colors.white;
      case 'ground': 
      return Colors.brown;
      case 'fairy': 
      return Colors.pink;
      case 'dark':
      return const Color.fromARGB(255, 1, 33, 60);
      case 'grass':
      return Colors.green;
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
