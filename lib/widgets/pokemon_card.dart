import 'package:flutter/material.dart';
import 'package:pokemon_app/custom-dart-extensions/capitalize_string_first_letter.dart';
import 'package:pokemon_app/global-functions-and-variables/global_variables.dart';
import 'package:pokemon_app/screens/pokemon_details_page.dart';

class PokemonCard extends StatelessWidget {
  final Map<String, dynamic> pokemonObject;

  const PokemonCard({super.key, required this.pokemonObject});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PokemonDetailsPage(pokemonObject: pokemonObject),
          )),
      child: Card(
        color: pokemoncardColorBasedOnPokemonType[pokemonObject['types'][0]
            ['type']['name']],
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                pokemonObject['name'].toString().capitalizeFirstLetter(),
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 3),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(4),
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent.withOpacity(0.1)),
                child: Text(
                  pokemonObject['types'][0]['type']['name']
                      .toString()
                      .capitalizeFirstLetter(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Hero(
                    tag: pokemonObject['name'],
                    child: Image.network(
                      pokemonObject['sprites']['back_default'],
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
