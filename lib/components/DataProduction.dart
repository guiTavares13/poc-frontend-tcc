import 'package:flutter/cupertino.dart';

import '../models/ForecastProduction.dart';
import 'DataItem.dart';

class DataProduction extends StatelessWidget {
  final List<ForecastProduction> forecastList;

  const DataProduction({required this.forecastList});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio:
          2 / 1, // Proporção da largura em relação à altura dos quadrados
      padding: const EdgeInsets.all(10),
      children: forecastList.map((forecast) {
        return Row(
          children: [
            DataItem(
              label: 'Temperatura',
              value: forecast.temperatureDay.toString(),
            ),
            DataItem(
              label: 'Umidade',
              value: forecast.humidityDay.toString(),
            ),
          ],
        );
      }).toList(),
    );
  }
}
