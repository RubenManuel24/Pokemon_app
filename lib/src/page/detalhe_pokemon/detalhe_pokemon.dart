import 'package:flutter/material.dart';
import 'package:pokemon_app/src/model/pokemon_model.dart';
import 'widget/custom_percentage.dart';

class DetalhePokemon extends StatelessWidget {
  const DetalhePokemon({super.key});

  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)!.settings.arguments as PokemonModel;
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
                                result.name,
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
                                "${result.weight}",
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
                                "${result.height}",
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
                          CustomPercentage(
                            value: result.hp.toDouble(),
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
                          CustomPercentage(
                            value: result.attack.toDouble(),
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
                          CustomPercentage(value: result.defese.toDouble())
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
                          CustomPercentage(value: result.specialDefese.toDouble())
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
                          CustomPercentage(
                            value: result.speed.toDouble(),
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
              child: Image.network(
                result.image,
                width: 300,
              )),
          Positioned(
              top: 60,
              right: 20,
              child: Text(
                "#00${result.id}",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.w800,
                    fontSize: 35),
              )),
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
                onPressed: () {},
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
