import 'package:flutter/material.dart';
import 'package:pokemon_app/global-functions-and-variables/convertPokemonObjectsIntoCards.dart';

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
        if (snapshot.hasData) {
          return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              children: snapshot.data as List<Widget>);
        }
        if (snapshot.hasError) {
          return Text("Deu pau: ${snapshot.error}");
        }
        return Text("Nada");
      },
    );
  }
}