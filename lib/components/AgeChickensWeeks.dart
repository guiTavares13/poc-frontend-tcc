import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/ForecastProduction.dart';

class AgeChickensWeeks extends StatelessWidget {
  final ForecastProduction forecastProduction;
  const AgeChickensWeeks({super.key, required this.forecastProduction});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Column(
            children: [
              Text('Idade das aves: ${forecastProduction.ageChickensWeeks}')
            ],
          ),
        ));
  }
}
