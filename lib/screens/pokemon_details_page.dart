import 'package:flutter/material.dart';
import 'package:pokemon_app/global-functions-and-variables/global_variables.dart';
import 'package:pokemon_app/widgets/custom_linear_percent_indicator.dart';

class PokemonDetailsPage extends StatelessWidget {
  final Map<String, dynamic> pokemonObject;
  const PokemonDetailsPage({super.key, required this.pokemonObject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              SizedBox(
                height: 370,
                child: Container(
                  padding: const EdgeInsets.only(top: 35, left: 15),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Image.asset('assets/images/boll_pokemon_black.png',
                      color: Colors.white.withOpacity(0.1)),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25, 70, 25, 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Name",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${pokemonObject['name'].toString()[0].toUpperCase()}${pokemonObject['name'].toString().substring(1).toLowerCase()}",
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Weight",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                pokemonObject['weight'].toString(),
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Height",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                pokemonObject['height'].toString(),
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          const Text(
                            "HP:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          CustomLinearPercentIndicator(
                            value: pokemonObject['stats'][0]['base_stat']
                                .toDouble(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Attack:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          CustomLinearPercentIndicator(
                            value: pokemonObject['stats'][1]['base_stat']
                                .toDouble(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Defese:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          CustomLinearPercentIndicator(
                              value: pokemonObject['stats'][2]['base_stat']
                                  .toDouble())
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "SD:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          CustomLinearPercentIndicator(
                              value: pokemonObject['stats'][3]['base_stat']
                                  .toDouble())
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Speed:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          CustomLinearPercentIndicator(
                            value: pokemonObject['stats'][4]['base_stat']
                                .toDouble(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
              top: 100,
              child: Hero(
                tag: pokemonObject['name'],
                child: Image.network(
                  pokemonObject['sprites']['back_default'],
                  scale: .1,
                  width: 300,
                ),
              )),
          Positioned(
              top: 60,
              right: 20,
              child: Text(
                "#${numberFormatter.format(pokemonObject['id'].toInt())}",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.w800,
                    fontSize: 35),
              )),
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}
