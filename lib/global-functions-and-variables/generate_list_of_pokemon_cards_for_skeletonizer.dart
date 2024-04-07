import 'package:flutter/material.dart';
import 'package:pokemon_app/widgets/pokemon_card_for_skeletonizer.dart';

List<Widget> generateListOfPokemonCardsForSkeletonizer() {
  List<Widget> listOfPokemonCardForSkeletonizer = [];
  for (int index = 0; index < 10; index++) {
    listOfPokemonCardForSkeletonizer.add(const PokemonCardForSkeletonizer());
  }
  return listOfPokemonCardForSkeletonizer;
}
