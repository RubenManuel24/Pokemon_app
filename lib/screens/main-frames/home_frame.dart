import 'package:flutter/material.dart';
import 'package:pokemon_app/global-functions-and-variables/convert_pokemon_objects_into_cards.dart';
import 'package:pokemon_app/global-functions-and-variables/generate_list_of_pokemon_cards_for_skeletonizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeFrame extends StatefulWidget {
  const HomeFrame({super.key});

  @override
  State<HomeFrame> createState() => _HomeFrameState();
}

class _HomeFrameState extends State<HomeFrame> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: convertPokemonObjectsIntoCards(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong: ${snapshot.error}"));
        }
        return Skeletonizer(
          enabled: !snapshot.hasData,
          child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              children: !snapshot.hasData ? generateListOfPokemonCardsForSkeletonizer():snapshot.data as List<Widget>),
        );
      },
    );
  }
}
