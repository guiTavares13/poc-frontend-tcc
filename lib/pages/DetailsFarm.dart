import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import '../components/AppDrawer.dart';
import '../components/ChartDataProvider.dart';
import '../data/data.dart';
import 'menu.dart';

class DetailsFarm extends StatefulWidget {
  const DetailsFarm({Key? key}) : super(key: key);

  @override
  State<DetailsFarm> createState() => _DetailsFarm();
}

class _DetailsFarm extends State<DetailsFarm> {
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();
  final TextEditingController _field3Controller = TextEditingController();

  Future<void> _sendData() async {
    final url = Uri.parse('http://192.168.15.5:9091/predictEggs');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'weekly_average_temperature': _field1Controller.text,
          'age_in_weeks': _field3Controller.text,
        }),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        List<ChartData> newChartData = processData(jsonData);
        Provider.of<ChartDataProvider>(context, listen: false)
            .updateChartData(newChartData);

        // Navegar para a próxima tela
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuPage(jsonData),
          ),
        );
      } else {
        // Lidar com erros na requisição
        print('Erro na requisição: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  void _showResponseDialog(String responseMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Resposta do servidor"),
          content: Text(responseMessage),
          actions: <Widget>[
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _field1Controller.dispose();
    _field3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _field1Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Quantidade de galinhas',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _field3Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Idade em Semanas',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _sendData,
              child: const Text('Atualizar'),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
