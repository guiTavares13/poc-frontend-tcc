import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'menu.dart';

class MinhaTela extends StatelessWidget {
  final TextEditingController ageChikensWeek = TextEditingController();
  final TextEditingController qdtChickens = TextEditingController();

  void enviarRequisicao(BuildContext context) async {
    final url = 'http://192.168.15.4:9091/weather/';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'age': ageChikensWeek.text,
        'qdt': qdtChickens.text,
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      // Processar os dados recebidos da API

      // Navegar para a próxima tela
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MenuPage(jsonData),
        ),
      );
    } else {
      print('Entrou no else');
      // Lidar com erros na requisição
      print('Erro na requisição: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados de produção de ovos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: ageChikensWeek,
              decoration: InputDecoration(
                labelText: 'Idade galinha em semanas',
              ),
            ),
            TextField(
              controller: qdtChickens,
              decoration: InputDecoration(
                labelText: 'Quantidade de galinhas',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => enviarRequisicao(context),
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProximaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Próxima Tela'),
      ),
      body: Center(
        child: Text('Esta é a próxima tela'),
      ),
    );
  }
}
