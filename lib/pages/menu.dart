import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:poc_frontend_tcc/components/AppDrawer.dart';
import 'package:poc_frontend_tcc/data/data.dart';
import 'package:poc_frontend_tcc/data/dummy_data.dart';
import 'package:poc_frontend_tcc/models/ForecastProduction.dart';
import 'package:poc_frontend_tcc/components/LineChart.dart';
import 'package:provider/provider.dart';
import '../components/ChartDataProvider.dart';
import '../components/DataProduction.dart';
import '../components/ForecastCard.dart';

class MenuPage extends StatelessWidget {
  final jsonData;
  List<ForecastProduction> loadedForecast = dummyForecastProduction;

  MenuPage(this.jsonData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData =
        processData(jsonData); // Processando os dados do jsonData

    final chartDataProvider =
        Provider.of<ChartDataProvider>(context, listen: false);
    chartDataProvider
        .updateChartData(chartData); // Atualizando os dados do gráfico

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Dashboard de Produção'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.teal,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                  color: Colors.teal[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Consumer<ChartDataProvider>(
                  builder: (context, chartDataProvider, _) {
                    List<ChartData> chartData = chartDataProvider.chartData;
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 300, // Defina a altura desejada aqui
                          child: MyLineChart(chartData),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ForecastCard(
              forecastList: loadedForecast,
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
