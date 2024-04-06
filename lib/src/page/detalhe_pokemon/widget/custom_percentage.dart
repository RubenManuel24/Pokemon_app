import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomPercentage extends StatelessWidget {

  const CustomPercentage({super.key, required this.value,});

  final double value;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
            animation: true,
            width: 250,
            lineHeight: 20,
            animationDuration: 2500,
            percent: value / 100,
            center: Text(
              '$value%',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            progressColor: value < 50 ? Colors.red : Colors.blue,
            backgroundColor: Colors.grey[300],
          );
  }
}
