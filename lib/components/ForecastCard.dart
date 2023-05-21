import 'package:flutter/material.dart';
import 'package:poc_frontend_tcc/models/ForecastProduction.dart';

class ForecastCard extends StatelessWidget {
  final List<ForecastProduction> forecastList;

  const ForecastCard({required this.forecastList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: forecastList.length,
      itemBuilder: (context, index) {
        ForecastProduction forecast = forecastList[index];
        return Card(
          child: ListTile(
            title: Text('Temperatura '),
            subtitle: Text('        22 ºC'),
            trailing: Text('Tempo limpo'),
          ),
        );
      },
    );
  }
}
