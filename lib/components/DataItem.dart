import 'package:flutter/material.dart';
import 'package:poc_frontend_tcc/models/ForecastProduction.dart';

class DataItem extends StatelessWidget {
  final String label;
  final String value;

  const DataItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Column(
          children: [
            Text('Label: $label'),
            Text('Value: $value'),
          ],
        ),
      ),
    );
  }
}
