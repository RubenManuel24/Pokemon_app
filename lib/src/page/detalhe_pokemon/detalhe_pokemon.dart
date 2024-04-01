import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                  child: Image.network('${result.image}',
                      color: Colors.white.withOpacity(0.1)),
                  padding: EdgeInsets.only(top: 35, left: 15),
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 70, 25, 20),
                  decoration: BoxDecoration(
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
                              Text(
                                "Name",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${result.name}",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                             Text(
                                "${result.weight}",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Height",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${result.height}",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Text(
                            "HP:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          CustomPercentage(
                            value: result.hp as double,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Attack:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          CustomPercentage(
                            value: result.attack as double,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Defese:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          CustomPercentage(value: result.defese as double)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Special Defese:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          CustomPercentage(value: result.specialDefese as double)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Speed:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          CustomPercentage(
                            value: result.speed as double,
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
              child: Image.asset(
                "assets/images/pokemon_PNG50.pn",
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
                icon: Icon(
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
