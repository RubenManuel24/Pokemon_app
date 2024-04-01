
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:pokemon_app/src/page/home/home_controller.dart';
import 'package:pokemon_app/src/page/home/home_page.dart';

class HomeRoute extends  FlutterGetItPageRouter{
  const HomeRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton((i) => HomeController(pokemonRepository: i()))
  ];

  @override
  String get routeName => '/home';

  @override
  WidgetBuilder get view => (_) => HomePage();

}