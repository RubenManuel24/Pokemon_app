import 'package:flutter_getit/flutter_getit.dart';
import 'package:pokemon_app/src/http_manager/rest_client.dart';
import 'package:pokemon_app/src/repository/pokemon_repository.dart';
import 'package:pokemon_app/src/repository/pokemon_repository_impl.dart';

import '../page/home/home_controller.dart';

class PokemonBindings extends ApplicationBindings{
  @override
  List<Bind<Object>> bindings() => [
    Bind.lazySingleton((i) => HomeController(pokemonRepository: i())),
    Bind.lazySingleton((i) => RestClient() ),
    Bind.lazySingleton<PokemonRepository>((i) => PokemonRepositoryImpl(restClient: i()))
];

}