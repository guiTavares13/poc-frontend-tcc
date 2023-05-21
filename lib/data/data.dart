class ChartData {
  final double date;
  final double resultPredicao;

  ChartData({required this.date, required this.resultPredicao});
}

List<ChartData> processData(dynamic jsonData) {
  List<dynamic> data = jsonData;
  List<ChartData> chartData = [];
  for (var item in data) {
    String date = item['date'];
    double resultPredicao = item['resultPredicao'];

    // Extrair os dois primeiros dígitos da data e convertê-los em double
    double parsedDate = double.parse(date.substring(0, 2));

    ChartData dataPoint =
        ChartData(date: parsedDate, resultPredicao: resultPredicao);
    chartData.add(dataPoint);
  }
  return chartData;
}
