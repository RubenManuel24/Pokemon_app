import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int currentFrameIndex = 0;
var numberFormatter = NumberFormat('000');
PageController mainFramesPageFramesController = PageController(
  initialPage: currentFrameIndex,
);

Map<String, Color> pokemoncardColorBasedOnPokemonType = {
  'fire': Colors.orange,
  'water': Colors.blue,
  'electric': Colors.yellow,
  'normal': Colors.grey,
  'flying': Colors.white,
  'ground': Colors.brown,
  'fairy': Colors.pink,
  'dark': const Color.fromARGB(255, 1, 33, 60),
  'grass': Colors.green,
  'bug': Colors.purple
};