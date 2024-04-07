import 'package:flutter/material.dart';

class PokemonCardForSkeletonizer extends StatelessWidget {
  const PokemonCardForSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.withOpacity(.7),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Pokemon Full Name",
              style: TextStyle(
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
              child: const Text(
                "Type",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 5),
            const Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Icon(Icons.catching_pokemon_rounded,size: 80,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
