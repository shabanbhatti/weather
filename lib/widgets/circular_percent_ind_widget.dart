import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercentIndWidget extends StatelessWidget {
  const CircularPercentIndWidget({
    super.key,
    required this.percent,
    required this.percentText,
    required this.color1,
    required this.color2,
    required this.title,
  });

  final double percent;
  final Color color1;
  final Color color2;
  final String title;
  final String percentText;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      percent: percent,
      animation: true,
      animationDuration: 1000,

      radius: 70,
      linearGradient: LinearGradient(colors: [color1, color2]),
      // progressColor: Colors.red,
      circularStrokeCap: CircularStrokeCap.round,
      // progressBorderColor: Colors.black.withAlpha(150),
      backgroundColor: Colors.grey,

      lineWidth: 7,
      center: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            percentText,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
