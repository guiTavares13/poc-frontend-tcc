import 'package:flutter/cupertino.dart';

import '../data/data.dart';

class ChartDataProvider with ChangeNotifier {
  List<ChartData> _chartData = [];

  List<ChartData> get chartData => _chartData;

  void updateChartData(List<ChartData> newData) {
    _chartData = newData;
    notifyListeners();
  }
}
