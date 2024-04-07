import 'package:flutter/material.dart';
import 'package:pokemon_app/http-requests-management/get_pokemons_from_restapi.dart';
import 'package:pokemon_app/widgets/pokemon_card.dart';

Future<List<Widget>> convertPokemonObjectsIntoCards() async {
  List<Map<String, dynamic>> listOfPokemonObjects =
      await getListOfPokemonsData();
  List<Widget> listOfPokemonCards = [];
  for (Map<String, dynamic> pokemonObject in listOfPokemonObjects) {
    listOfPokemonCards.add(PokemonCard(
      pokemonObject: pokemonObject,
    ));
  }
  return listOfPokemonCards;
}