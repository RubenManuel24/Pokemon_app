import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pokemon_app/src/http_manager/rest_client.dart';
import 'package:pokemon_app/src/model/pokemon_model.dart';
import 'package:pokemon_app/src/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({
    required this.restClient,
  });

  final RestClient restClient;

  @override
  Future<List<PokemonModel>> getAllPokemon() async {
    List<PokemonModel> pokemonList = [];

   try{

       final response = await restClient.get('https://pokeapi.co/api/v2/pokemon');
       final data = response.data;
           final List<dynamic> pokemonResult = data['results'];
           
       for(var pokemon in pokemonResult){
          final pokemonResponse = await restClient.get(pokemon['url']);
          final pokemonData = pokemonResponse.data;
         
          final result = PokemonModel.fromMap(pokemonData);
          
          pokemonList.add(result);
       }

       return pokemonList;
    

   } on DioException catch (e, s) {
     log("Erro ao buscar os pokemon", error: e, stackTrace: s);
     return [

     ];
   }
   
   
    
  }
}
