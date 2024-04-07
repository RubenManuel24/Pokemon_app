import 'dart:convert';
import 'package:http/http.dart' as http;
Future<List<Map<String, dynamic>>> getListOfPokemonsData() async {
  final httpResponse =
      await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon"));
  final List<dynamic> pokemonsFirstObjectsFromRESTAPI =
      (jsonDecode(httpResponse.body) as Map<String, dynamic>)['results'];

  List<Map<String, dynamic>> listOfPokemonObjects = [];

  for (Map<String, dynamic> pokemonObjectFromRESTAPI
      in pokemonsFirstObjectsFromRESTAPI) {
    listOfPokemonObjects.add(jsonDecode((await http.get(
      Uri.parse(
        pokemonObjectFromRESTAPI['url'],
      ),
    ))
        .body) as Map<String, dynamic>);
  }
  return listOfPokemonObjects;
}